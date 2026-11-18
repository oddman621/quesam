const std = @import("std");

// Q3BSP has 4 datatype, converting into Zig: u8, i32, f32, [:0]u8

// `shaders`(should be `materials`) and `fogs`(should be `fogvolumes`), these two are confusing...
pub const LumpKind = enum(usize) {
    entities = 0,
    shaders = 1, // Texture(Material) Infos
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
    fogs = 12, // fogvolumes(including shader)
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

pub const BspEntities = struct {
    str_entities: []const u8,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspEntities {
        return .{ .str_entities = try allocator.dupe(u8, chunk) };
    }
    pub fn deinit(self: BspEntities, allocator: std.mem.Allocator) void {
        allocator.free(self.str_entities);
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

pub const BspPlane = extern struct {
    normal: [3]f32,
    distance: f32,
};

pub const BspPlanes = struct {
    planes: []BspPlane,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspPlanes {
        const planes = try allocator.dupe(BspPlane, @alignCast(std.mem.bytesAsSlice(BspPlane, chunk)));
        return .{ .planes = planes };
    }

    pub fn deinit(self: BspPlanes, allocator: std.mem.Allocator) void {
        allocator.free(self.planes);
    }
};

pub const BspNode = extern struct {
    plane_num: i32,
    children: [2]i32,
    mins: [3]i32,
    maxs: [3]i32,
};

pub const BspNodes = struct {
    nodes: []BspNode,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspNodes {
        const nodes = try allocator.dupe(BspNode, @alignCast(std.mem.bytesAsSlice(BspNode, chunk)));
        return .{ .nodes = nodes };
    }

    pub fn deinit(self: BspNodes, allocator: std.mem.Allocator) void {
        allocator.free(self.nodes);
    }
};

pub const BspLeaf = extern struct {
    cluster: i32,
    area: i32,

    mins: [3]i32,
    maxs: [3]i32,

    first_leaf_surface: i32,
    num_leaf_surfaces: i32,

    first_leaf_brush: i32,
    num_leaf_brushes: i32,
};

pub const BspLeaves = struct {
    leaves: []BspLeaf,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspLeaves {
        const leaves = try allocator.dupe(BspLeaf, @alignCast(std.mem.bytesAsSlice(BspLeaf, chunk)));
        return .{ .leaves = leaves };
    }

    pub fn deinit(self: BspLeaves, allocator: std.mem.Allocator) void {
        allocator.free(self.leaves);
    }
};

pub const BspLeafSurface = i32;

pub const BspLeafSurfaces = struct {
    leaf_surfaces: []BspLeafSurface,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspLeafSurfaces {
        const leaf_surfaces = try allocator.dupe(BspLeafSurface, @alignCast(std.mem.bytesAsSlice(BspLeafSurface, chunk)));
        return .{ .leaf_surfaces = leaf_surfaces };
    }

    pub fn deinit(self: BspLeafSurfaces, allocator: std.mem.Allocator) void {
        allocator.free(self.leaf_surfaces);
    }
};

pub const BspLeafBrush = i32;

pub const BspLeafBrushes = struct {
    leaf_brushes: []BspLeafBrush,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspLeafBrushes {
        const leaf_brushes = try allocator.dupe(BspLeafBrush, @alignCast(std.mem.bytesAsSlice(BspLeafBrush, chunk)));
        return .{ .leaf_brushes = leaf_brushes };
    }

    pub fn deinit(self: BspLeafBrushes, allocator: std.mem.Allocator) void {
        allocator.free(self.leaf_brushes);
    }
};

pub const BspModel = extern struct {
    min: [3]f32,
    max: [3]f32,
    first_surface: i32,
    surface_num: i32,
    first_brush: i32,
    brush_num: i32,
};

pub const BspModels = struct {
    models: []BspModel,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspModels {
        const models = try allocator.dupe(BspModel, @alignCast(std.mem.bytesAsSlice(BspModel, chunk)));
        return .{ .models = models };
    }
    pub fn deinit(self: BspModels, allocator: std.mem.Allocator) void {
        allocator.free(self.models);
    }
};

pub const BspBrush = extern struct {
    first_side: i32,
    num_sides: i32,
    shader_num: i32,
};

pub const BspBrushes = struct {
    brushes: []BspBrush,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspBrushes {
        const brushes = try allocator.dupe(BspBrush, @alignCast(std.mem.bytesAsSlice(BspBrush, chunk)));
        return .{ .brushes = brushes };
    }

    pub fn deinit(self: BspBrushes, allocator: std.mem.Allocator) void {
        allocator.free(self.brushes);
    }
};

pub const BspBrushSide = extern struct {
    plane_num: i32,
    shader_num: i32,
};

pub const BspBrushSides = struct {
    brush_sides: []BspBrushSide,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspBrushSides {
        const brush_sides = try allocator.dupe(
            BspBrushSide,
            @alignCast(std.mem.bytesAsSlice(BspBrushSide, chunk))
        );
        return .{ .brush_sides = brush_sides };
    }
    
    pub fn deinit(self: BspBrushSides, allocator: std.mem.Allocator) void {
        allocator.free(self.brush_sides);
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

pub const BspFog = struct {
    shader: [:0]const u8,
    brush_num: i32,
    visible_side: i32, // unknown, the value is almost always 5
};

pub const BspFogs = struct {
    fogs: []BspFog,

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspFogs {
        const max_qpath = 64; // common/qfiles.h 36: #define MAX_QPATH 64
        const stride = max_qpath + 4 + 4;
        if (chunk.len % stride != 0) return error.InvalidChunkSize;
        const length = chunk.len / stride;
        var fogs = try allocator.alloc(BspFog, length);
        errdefer allocator.free(fogs);

        var i: usize = 0;
        errdefer {
            for (0..i) |j| {
                allocator.free(fogs[j].shader);
            }
        }
        while(i < length) : (i += 1) {
            const offset = stride * i;
            const shader: []const u8 = std.mem.sliceTo(chunk[offset..offset+max_qpath].ptr, 0);
            fogs[i].shader = try allocator.dupeSentinel(u8, shader, 0);
            fogs[i].brush_num = std.mem.readInt(i32, chunk[offset+max_qpath..][0..4], .little);
            fogs[i].visible_side = std.mem.readInt(i32, chunk[offset+max_qpath..][4..8], .little);
        }

        return .{ .fogs = fogs };
    }

    pub fn deinit(self: BspFogs, allocator: std.mem.Allocator) void {
        for (self.fogs) |fog| {
            allocator.free(fog.shader);
        }
        allocator.free(self.fogs);
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

pub const BspLightGrid = extern struct { // 8 Bytes
    ambient: [3]u8,
    directional: [3]u8,
    lat_long: [2]u8,
};

pub const BspLightGrids = struct {
    light_grids: []BspLightGrid, // index = x + len_x * (y + len_y * z) => [z][y][x]lightgrid

    pub fn init(
        allocator: std.mem.Allocator,
        chunk: []const u8
    ) !BspLightGrids {
        const light_grids = try allocator.dupe(
            BspLightGrid,
            std.mem.bytesAsSlice(BspLightGrid, chunk)
        );
        return .{ .light_grids = light_grids };
    }
    
    pub fn deinit(self: BspLightGrids, allocator: std.mem.Allocator) void {
        allocator.free(self.light_grids);
    }
};

pub const BspVisibility = struct {
    // Header
    vecs_num: i32, // numClusters
    vec_size: i32, // bytesPerCluster

    // Data
    vecs: []u8, // PVS (len = vecs_num * vec_size)

    pub fn init(allocator: std.mem.Allocator, chunk: []const u8) !BspVisibility {
        const vecs_num = std.mem.readInt(i32, chunk[0..4], .little);
        const vec_size = std.mem.readInt(i32, chunk[4..8], .little);
        const vecs = try allocator.dupe(u8, chunk[8..]);

        return .{
            .vecs_num = vecs_num,
            .vec_size = vec_size,
            .vecs = vecs,
        };
    }

    pub fn deinit(self: BspVisibility, allocator: std.mem.Allocator) void {
        allocator.free(self.vecs);
    }
};

pub const BspRaw = struct {
    header: BspHeader,

    entities: BspEntities,
    shaders: BspShaders,
    planes: BspPlanes,
    nodes: BspNodes,
    leaves: BspLeaves,
    leaf_surfaces: BspLeafSurfaces,
    leaf_brushes: BspLeafBrushes,
    models: BspModels,
    brushes: BspBrushes,
    brush_sides: BspBrushSides,
    draw_vertices: BspDrawVertices,
    draw_indices: BspDrawIndices,
    fogs: BspFogs,
    surfaces: BspSurfaces,
    lightmaps: BspLightMaps,
    lightgrids: BspLightGrids,
    visibility: BspVisibility,

    pub fn load(allocator: std.mem.Allocator, io: std.Io, filepath: []const u8) !BspRaw {
        const cwd = std.Io.Dir.cwd();
        const bytes = try cwd.readFileAlloc(io, filepath, allocator, .unlimited);
        defer allocator.free(bytes);
        
        const header = BspHeader.fromBytes(bytes);

        const entities = try BspEntities.init(
            allocator,
            getChunk(header, bytes, .entities)
        );
        const shaders = try BspShaders.init(
            allocator,
            getChunk(header, bytes, .shaders)
        );
        const planes = try BspPlanes.init(
            allocator,
            getChunk(header, bytes, .planes)
        );
        const nodes = try BspNodes.init(
            allocator,
            getChunk(header, bytes, .nodes)
        );
        const leaves = try BspLeaves.init(
            allocator,
            getChunk(header, bytes, .leafs)
        );
        const leaf_surfaces = try BspLeafSurfaces.init(
            allocator,
            getChunk(header, bytes, .leafsurfaces)
        );
        const leaf_brushes = try BspLeafBrushes.init(
            allocator,
            getChunk(header, bytes, .leafbrushes)
        );
        const models = try BspModels.init(
            allocator,
            getChunk(header, bytes, .models)
        );
        const brushes = try BspBrushes.init(
            allocator,
            getChunk(header, bytes, .brushes)
        );
        const brush_sides = try BspBrushSides.init(
            allocator,
            getChunk(header, bytes, .brushsides)
        );
        const drawVertices = try BspDrawVertices.init(
            allocator,
            getChunk(header, bytes, .drawverts)
        );
        const drawIndices = try BspDrawIndices.init(
            allocator,
            getChunk(header, bytes, .drawindexes)
        );
        const fogs = try BspFogs.init(
            allocator,
            getChunk(header, bytes, .fogs)
        );
        const surfaces = try BspSurfaces.init(
            allocator,
            getChunk(header, bytes, .surfaces)
        );
        const lightmaps = try BspLightMaps.init(
            allocator,
            getChunk(header, bytes, .lightmaps)
        );
        const lightgrids = try BspLightGrids.init(
            allocator,
            getChunk(header, bytes, .lightgrid)
        );
        const visibility = try BspVisibility.init(
            allocator,
            getChunk(header, bytes, .visibility)
        );
        
        return .{
            .header = header,
            .entities = entities,
            .shaders = shaders,
            .planes = planes,
            .nodes = nodes,
            .leaves = leaves,
            .leaf_surfaces = leaf_surfaces,
            .leaf_brushes = leaf_brushes,
            .models = models,
            .brushes = brushes,
            .brush_sides = brush_sides,
            .draw_indices = drawIndices,
            .draw_vertices = drawVertices,
            .fogs = fogs,
            .surfaces = surfaces,
            .lightmaps = lightmaps,
            .lightgrids = lightgrids,
            .visibility = visibility,
        };
    }

    pub fn unload(self: BspRaw, allocator: std.mem.Allocator) void {
        self.entities.deinit(allocator);
        self.shaders.deinit(allocator);
        self.planes.deinit(allocator);
        self.nodes.deinit(allocator);
        self.leaves.deinit(allocator);
        self.leaf_surfaces.deinit(allocator);
        self.leaf_brushes.deinit(allocator);
        self.models.deinit(allocator);
        self.brushes.deinit(allocator);
        self.brush_sides.deinit(allocator);
        self.draw_vertices.deinit(allocator);
        self.draw_indices.deinit(allocator);
        self.fogs.deinit(allocator);
        self.surfaces.deinit(allocator);
        self.lightmaps.deinit(allocator);
        self.lightgrids.deinit(allocator);
        self.visibility.deinit(allocator);
    }

    fn getChunk(header: BspHeader, bytes: []const u8, kind: LumpKind) []const u8 {
        const lump = header.getLump(kind);
        return bytes[lump.offset..][0..lump.length];
    }
};




// TODO: Move this namespace to another module.
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

test "[BspRaw] q3dm3" {
    const allocator = std.testing.allocator;
    const io = std.testing.io;

    const bsp_raw = try BspRaw.load(allocator, io, "assets/maps/q3dm3.bsp");
    defer bsp_raw.unload(allocator);

    // Visibility Test
    const visibility = bsp_raw.visibility;
    const expect_length = visibility.vec_size * visibility.vecs_num;
    const actual_length = @as(i32, @intCast(visibility.vecs.len));
    try std.testing.expectEqual(expect_length, actual_length);
    
}
