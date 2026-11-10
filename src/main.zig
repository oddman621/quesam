const std = @import("std");
const rl = @import("raylib");

const quesam = @import("quesam");

// Q3BSP has 4 datatype, converting into Zig: u8, i32, f32, [:0]u8

pub const LumpKind = enum(usize) {
    entities = 0,
    shaders = 1, // Texture Infos
    planes = 2, // splitting planes
    nodes = 3, // BSP nodes
    leafs = 4,
    leafsurfaces = 5,
    leafbrushes = 6,
    models = 7, // world models
    brushes = 8, // brush info for collision
    brushsides = 9, // brush surface info
    drawverts = 10, // level vertices
    drawindexes = 11, // indices for vertex triangles
    fogs = 12,
    surfaces = 13, // render face info
    lightmaps = 14,
    lightgrid = 15,
    visibility = 16,
};

pub const Lump = struct {
    offset: usize, // fileofs: i32
    length: usize, // filelen: i32

    pub fn fromChunk(chunk: []const u8) Lump {
        const fileofs = std.mem.readInt(i32, chunk[0..4], .little);
        const filelen = std.mem.readInt(i32, chunk[4..8], .little);
        return .{ .offset = @intCast(fileofs), .length = @intCast(filelen) };
    }

    pub fn fromBytes(bytes: []const u8, kind: LumpKind) Lump {
        const i = @intFromEnum(kind);
        const offset = 8 + i * 8;
        return fromChunk(bytes[offset..]);
    }
};

pub const BspHeader = struct {
    
    ident: [4]u8,
    version: i32,
    lumps: std.EnumArray(LumpKind, Lump),

    pub fn getLump(self: BspHeader, kind: LumpKind) Lump { return self.lumps.get(kind); }

    pub fn fromBytes(bytes: []const u8) BspHeader {
        const ident = bytes[0..4].*;
        const version = std.mem.readInt(i32, bytes[4..8], .little);
        
        var lumps = std.EnumArray(LumpKind, Lump).initUndefined();
        for (0..std.EnumArray(LumpKind, Lump).len) |i| {
            const kind: LumpKind = @enumFromInt(i);
            lumps.set(kind, Lump.fromBytes(bytes, kind));
        }
        
        return .{ .ident = ident, .version = version, .lumps = lumps };
    }
};

pub const BspShader = struct {
    path: [:0]const u8, // null-terminated for raylib compatibility.
    surface_flags: u32,
    content_flags: u32,
};

pub const BspShaders = struct {
    shaders: []BspShader,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspShaders {
        const max_qpath = 64; // common/qfiles.h 36: #define MAX_QPATH 64
        const stride = max_qpath + 4 + 4;
        const len = chunk.len / stride;
        const shaders = try allocator.alloc(BspShader, len);

        for (shaders, 0..) |*shader, i| {
            const offset = i * stride;
            const path: []const u8 = std.mem.sliceTo(chunk[offset..offset+max_qpath].ptr, 0);
            shader.path = try allocator.dupeSentinel(u8, path, 0);
            
            shader.surface_flags = @intCast(std.mem.readInt(i32, chunk[offset+max_qpath..][0..4], .little));
            shader.content_flags = @intCast(std.mem.readInt(i32, chunk[offset+max_qpath..][4..8], .little));
        }

        return .{ .shaders = shaders };
    }

    pub fn deinit(self: BspShaders, allocator: std.mem.Allocator) void {
        for (self.shaders) |shader| {
            allocator.free(shader.path);
        }
        allocator.free(self.shaders);
    }
};

pub const BspDrawVertex = extern struct { // C-compatible interleaved GPU vertex layout
    position: [3]f32,
    texcoord0: [2]f32, //st[2]
    texcoord1: [2]f32, //lightmap[2]
    normal: [3]f32,
    color: [4]u8,
};

pub const BspDrawVertices = struct {
    vertices: []BspDrawVertex,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspDrawVertices {
        const stride = @sizeOf(BspDrawVertex);
        const len = chunk.len / stride;
        const vertices = try allocator.alloc(BspDrawVertex, len);
        @memcpy(vertices, std.mem.bytesAsSlice(BspDrawVertex, chunk));
        return .{ .vertices = vertices };
    }

    pub fn deinit(self: BspDrawVertices, allocator: std.mem.Allocator) void {
        allocator.free(self.vertices);
    }
};

pub const BspDrawIndices = struct {
    indices: []i32,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspDrawIndices {
        const length = chunk.len / 4;
        const indices = try allocator.alloc(i32, length);
        @memcpy(indices, std.mem.bytesAsSlice(i32, chunk));

        return .{ .indices = indices };
    }
    
    pub fn deinit(self: BspDrawIndices, allocator: std.mem.Allocator) void {
        allocator.free(self.indices);
    }
};

pub const SurfaceType = enum(i32) {
    planar = 1, // plane
    patch = 2, // bezier patch
    triangle_soup = 3, // triangle
    flare = 4, // light
};

pub const BspSurface = extern struct {
    shader_num: i32,
    fog_num: i32,
    surface_type: i32,
    first_vert: i32,
    num_verts: i32,
    first_index: i32,
    num_indices: i32,
    lightmap_num: i32,
    lightmap_x: i32,
    lightmap_y: i32,
    lightmap_width: i32,
    lightmap_height: i32,
    lightmap_origin: [3]f32,
    lightmap_vecs: [3][3]f32,
    patch_width: i32,
    patch_height: i32,
};

pub const BspSurfaces = struct {
    surfaces: []BspSurface,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspSurfaces {
        const length = chunk.len / @sizeOf(BspSurface);
        const surfaces = try allocator.alloc(BspSurface, length);
        @memcpy(surfaces, std.mem.bytesAsSlice(BspSurface, chunk));
        return .{ .surfaces = surfaces };
    }

    pub fn deinit(self: BspSurfaces, allocator: std.mem.Allocator) void {
        allocator.free(self.surfaces);
    }
};

pub const Bsp = struct {
    arena: std.heap.ArenaAllocator,
    header: BspHeader,
    shaders: BspShaders,
    draw_vertices: BspDrawVertices,
    draw_indices: BspDrawIndices,
    surfaces: BspSurfaces,

    pub fn init(allocator: std.mem.Allocator, io: std.Io, filepath: []const u8) !Bsp {
        
        const cwd = std.Io.Dir.cwd();
        const bytes = try cwd.readFileAlloc(io, filepath, allocator, .unlimited);
        defer allocator.free(bytes);
        
        const header = BspHeader.fromBytes(bytes);

        var arena = std.heap.ArenaAllocator.init(allocator);
        const draw_indices = try BspDrawIndices.init(arena.allocator(), getChunk(header, bytes, .drawindexes));
        const draw_vertices = try BspDrawVertices.init(arena.allocator(), getChunk(header, bytes, .drawverts));
        const shaders = try BspShaders.init(arena.allocator(), getChunk(header, bytes, .shaders));
        const surfaces = try BspSurfaces.init(arena.allocator(), getChunk(header, bytes, .surfaces));
        
        return .{
            .arena = arena,
            .header = header,
            .shaders = shaders,
            .draw_indices = draw_indices,
            .draw_vertices = draw_vertices,
            .surfaces = surfaces,
        };
    }

    pub fn deinit(self: Bsp) void { self.arena.deinit(); }

    fn getChunk(header: BspHeader, bytes: []const u8, kind: LumpKind) []const u8 {
        const lump = header.getLump(kind);
        return bytes[lump.offset..][0..lump.length];
    }
};



////////////// BSP end //////////////////////
/////////////// main (print debug)  /////////////////////



pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;
    
    // Read Level.bsp
    const bsp_file_path = "assets/maps/Level.bsp";
    const level_bsp = try Bsp.init(allocator, init.io, bsp_file_path);
    defer level_bsp.deinit();

    std.debug.print("Shaders: \n", .{});
    for (level_bsp.shaders.shaders) |shader| {
        std.debug.print("\tpath: {s}\n", .{ shader.path });
        std.debug.print("\tflag: {d} {d}\n", .{ shader.surface_flags, shader.content_flags });
    }
    std.debug.print("DrawIndexes: {any}\n", .{ level_bsp.draw_indices.indices });
    std.debug.print("DrawVertexes: {any}\n", .{ level_bsp.draw_vertices.vertices });
    std.debug.print("Surfaces: {any}\n", .{ level_bsp.surfaces.surfaces });
}








////////////////////////////raylib app/////////////////////////////////////




fn runRaylibApp() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    // JPG load test (does nothing)
    const image = try rl.loadImage("assets/textures/gothic_ceiling/stucco7top.jpg"); // TODO: raylib 의존성을 없앨 수 있을까? (jpg를 Zig io 바이트로 읽고...)
    const texture = try rl.loadTextureFromImage(image);
    defer rl.unloadTexture(texture);
    rl.unloadImage(image);

    // Set exit key for convenience
    rl.setExitKey(.escape);
    
    // Main game loop
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.white);
        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
