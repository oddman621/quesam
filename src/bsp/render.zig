const std = @import("std");
const raw = @import("raw.zig");
const BspRaw = raw.BspRaw;

// Regroup BSP's data into `Dictionary{(shader, lightmap): T}`.
// NOTICE: This regrouping does not consider the render priority for transparent textures. Maybe TODO?
const HashMap = struct {
    const Key = struct { shader_num: i32, lightmap_num: i32 };
    const IndexValue = std.ArrayList(u32);
    const IndexHashMap = std.AutoHashMap(Key, IndexValue);

    fn createIndexHashMap(
        allocator: std.mem.Allocator,
        surfaces: raw.BspSurfaces,
        draw_indices: raw.BspDrawIndices,
    ) !IndexHashMap {
        var hashmap = IndexHashMap.init(allocator);
        errdefer destroyIndexHashMap(allocator, &hashmap);

        const draw_indexes = draw_indices.indices;
        for (surfaces.surfaces) |surface| {
            switch (surface.surface_type) {
                .triangle_soup, .planar => {},
                .patch => continue, // TODO: Add Patch Tesselation
                .flare => continue, // TODO: Add Flare
                .bad => continue,
            }
            const shader_num = surface.shader_num;
            const lightmap_num = surface.lightmap_num;
            const key = Key{ .shader_num = shader_num, .lightmap_num = lightmap_num };

            const indices_ptr = (try hashmap.getOrPutValue(key, IndexValue.empty)).value_ptr;
            const first_vert = surface.first_vert;
            const first_index = surface.first_index;
            const index_num = surface.num_indices;
            if (@as(u32, @intCast(index_num)) % 3 != 0) return error.IndexNumberIsNot3n;
            for (0..@intCast(index_num)) |i| {
                try indices_ptr.append(allocator, @intCast(draw_indexes[@as(usize, @intCast(first_index)) + i] + first_vert));
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

pub const Vertex = raw.BspDrawVertex;

// Reorganize BSP data for OpenGL VBO/EBO.
pub const Meshes = struct {
    mesh_infos: []MeshInfo,
    vertices: []Vertex, // Whole vertex data of BSP. This goes to VBO.
    indices: []u32, // Reorganized(by shader_num and lightmap_num) index array of BSP. This goes to EBO.

    pub fn init(
        allocator: std.mem.Allocator,
        surfaces: raw.BspSurfaces,
        draw_vertices: raw.BspDrawVertices,
        draw_indices: raw.BspDrawIndices,
    ) !Meshes {
        var hashmap = try HashMap.createIndexHashMap(allocator, surfaces, draw_indices);
        defer HashMap.destroyIndexHashMap(allocator, &hashmap);

        var mesh_infos = try allocator.alloc(MeshInfo, hashmap.count());
        errdefer allocator.free(mesh_infos);
        var indices = std.ArrayList(u32).empty;
        errdefer indices.deinit(allocator);
        var i: usize = 0;
        var it = hashmap.iterator();
        while (it.next()) |entry| {
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
