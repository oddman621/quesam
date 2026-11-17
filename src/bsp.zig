const std = @import("std");

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

    pub const stride = @sizeOf(BspDrawVertex);
    pub const offset_position = 0;
    pub const offset_texcoord0 = 3 * @sizeOf(f32);
    pub const offset_texcoord1 = 5 * @sizeOf(f32);
    pub const offset_normal = 7 * @sizeOf(f32);
    pub const offset_color = 10 * @sizeOf(f32);

    pub const len_position = 3;
    pub const len_texcoord0 = 2;
    pub const len_texcoord1 = 2;
    pub const len_normal = 3;
    pub const len_color = 4;
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

pub const BspDrawIndex = i32;

// Notice that draw_index value is not an absolute index value. It should be added with `first_vert`.
pub const BspDrawIndices = struct {
    indices: []BspDrawIndex,

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
    bad = 0, // do not render this
    planar = 1, // plane
    patch = 2, // bezier patch
    triangle_soup = 3, // triangle
    flare = 4, // light
};

pub const BspSurface = extern struct {
    shader_num: i32,
    fog_num: i32,
    surface_type: SurfaceType,
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

pub const BspLightMap = [128][128][3]u8;

pub const BspLightMaps = struct {
    lightmaps: []BspLightMap,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspLightMaps {
        const stride = @sizeOf(BspLightMap); // 128 * 128 * 3 = 49152 bytes
        const length = chunk.len / stride; 
        const lightmaps = try allocator.alloc(BspLightMap, length);
        @memcpy(lightmaps, std.mem.bytesAsSlice(BspLightMap, chunk));
        return .{ .lightmaps = lightmaps };
    }

    pub fn deinit(self: BspLightMaps, allocator: std.mem.Allocator) void {
        allocator.free(self.lightmaps);
    }
};

pub const BspRaw = struct {
    allocator: std.mem.Allocator,
    header: BspHeader,
    shaders: BspShaders,
    draw_vertices: BspDrawVertices,
    draw_indices: BspDrawIndices,
    surfaces: BspSurfaces,
    lightmaps: BspLightMaps,

    pub fn load(allocator: std.mem.Allocator, io: std.Io, filepath: []const u8) !BspRaw {
        const cwd = std.Io.Dir.cwd();
        const bytes = try cwd.readFileAlloc(io, filepath, allocator, .unlimited);
        defer allocator.free(bytes);
        
        const header = BspHeader.fromBytes(bytes);

        const drawIndices = try BspDrawIndices.init(
            allocator,
            getChunk(header, bytes, .drawindexes)
        );
        const drawVertices = try BspDrawVertices.init(
            allocator,
            getChunk(header, bytes, .drawverts)
        );
        const shaders = try BspShaders.init(
            allocator,
            getChunk(header, bytes, .shaders)
        );
        const surfaces = try BspSurfaces.init(
            allocator,
            getChunk(header, bytes, .surfaces)
        );
        const lightmaps = try BspLightMaps.init(
            allocator,
            getChunk(header, bytes, .lightmaps)
        );
        
        return .{
            .allocator = allocator,
            .header = header,
            .shaders = shaders,
            .draw_indices = drawIndices,
            .draw_vertices = drawVertices,
            .surfaces = surfaces,
            .lightmaps = lightmaps,
        };
    }

    pub fn unload(self: BspRaw) void {
        self.shaders.deinit(self.allocator);
        self.draw_vertices.deinit(self.allocator);
        self.draw_indices.deinit(self.allocator);
        self.surfaces.deinit(self.allocator);
        self.lightmaps.deinit(self.allocator);
    }

    fn getChunk(header: BspHeader, bytes: []const u8, kind: LumpKind) []const u8 {
        const lump = header.getLump(kind);
        return bytes[lump.offset..][0..lump.length];
    }
};





pub const bsp_render = struct {

    // Regroup BSP's data into `Dictionary{(shader, lightmap): T}`.
    // NOTICE: This regrouping does not consider the render priority for transparent textures. Maybe TODO?
    const HashMap = struct {
        const Key = struct { shader_num: i32, lightmap_num: i32 };
        const IndexValue = std.ArrayList(u32);
        const IndexHashMap = std.AutoHashMap(Key, IndexValue);

        fn createIndexHashMap(
            allocator: std.mem.Allocator,
            surfaces: BspSurfaces,
            draw_indices: BspDrawIndices,
        ) !IndexHashMap {
            var hashmap = IndexHashMap.init(allocator);
            errdefer destroyIndexHashMap(allocator, &hashmap);

            const draw_indexes = draw_indices.indices;
            for (surfaces.surfaces) |surface| {
                switch (surface.surface_type) {
                    .triangle_soup, .planar => {},
                    .patch => continue, // TODO: Add Patch Tesselation
                    .flare => continue, // TODO: Add Flare
                    .bad  => continue,
                }
                const shader_num = surface.shader_num;
                const lightmap_num = surface.lightmap_num;
                const key = Key { .shader_num = shader_num, .lightmap_num = lightmap_num };
            
                const indices_ptr = (try hashmap.getOrPutValue(key, IndexValue.empty)).value_ptr;
                const first_vert = surface.first_vert;
                const first_index = surface.first_index;
                const index_num = surface.num_indices;
                if (@as(u32, @intCast(index_num)) % 3 != 0) return error.IndexNumberIsNot3n;
                for (0.. @intCast(index_num)) |i| {
                    try indices_ptr.append(
                        allocator,
                        @intCast(draw_indexes[@as(usize, @intCast(first_index)) + i] + first_vert)
                    );
                }
            }

            return hashmap;
        }

        fn destroyIndexHashMap(allocator: std.mem.Allocator, hashmap: *IndexHashMap) void {
            var it = hashmap.valueIterator();
            while (it.next()) |value| {
                value.deinit(allocator);
            }
            hashmap.deinit();
        }
    };
    
    pub const MeshInfo = struct {
        shader_num: i32,
        lightmap_num: i32,

        // index infos of indices array.
        first_index: u32,
        index_count: u32,
    };

    pub const Vertex = BspDrawVertex;

    // Reorganize BSP data for OpenGL VBO/EBO.
    pub const Meshes = struct {
        mesh_infos: []MeshInfo,
        vertices: []Vertex, // Whole vertex data of BSP. This goes to VBO.
        indices: []u32, // Reorganized(by shader_num and lightmap_num) index array of BSP. This goes to EBO.

        pub fn init(
            allocator: std.mem.Allocator,
            surfaces: BspSurfaces,
            draw_vertices: BspDrawVertices,
            draw_indices: BspDrawIndices,
        ) !Meshes {
            var hashmap = try HashMap.createIndexHashMap(
                allocator,
                surfaces,
                draw_indices
            );
            defer HashMap.destroyIndexHashMap(allocator, &hashmap);

            var mesh_infos = try allocator.alloc(MeshInfo, hashmap.count());
            errdefer allocator.free(mesh_infos);
            var indices = std.ArrayList(u32).empty;
            errdefer indices.deinit(allocator);
            var i: usize = 0;
            var it = hashmap.iterator();
            while(it.next()) |entry| {
                const first_index = indices.items.len;
                const index_count = entry.value_ptr.items.len;
                try indices.appendSlice(allocator, entry.value_ptr.items);
            
                mesh_infos[i] = .{
                    .shader_num = entry.key_ptr.shader_num,
                    .lightmap_num = entry.key_ptr.lightmap_num,
                    .first_index = @intCast(first_index),
                    .index_count = @intCast(index_count),
                };
                i += 1;
            }

            return .{
                .mesh_infos = mesh_infos,
                .vertices = try allocator.dupe(Vertex, draw_vertices.vertices),
                .indices = try indices.toOwnedSlice(allocator),
            };
        }

        pub fn deinit(self: Meshes, allocator: std.mem.Allocator) void {
            allocator.free(self.mesh_infos);
            allocator.free(self.vertices);
            allocator.free(self.indices);
        }
    };
};
