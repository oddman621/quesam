const std = @import("std");
const raw = @import("raw.zig");
const BspDrawVertex = raw.BspDrawVertex;
const BspDrawVertices = raw.BspDrawVertices;
const BspDrawIndices = raw.BspDrawIndices; // no use?
const BspSurface = raw.BspSurface; // no use?

pub const TesselatedPatch = struct {
    vertices: []BspDrawVertex,
    indices: []i32,

    pub fn init(allocator: std.mem.Allocator, comptime RES_U: usize, comptime RES_V: usize, draw_vertices: BspDrawVertices, first_vert: i32, patch_width: i32, patch_height: i32) !TesselatedPatch {
        const vertices = try Bezier3x3Quad.createPatchVertices(RES_U, RES_V, allocator, first_vert, patch_width, patch_height, draw_vertices);
        errdefer allocator.free(vertices);
        const count = vertices.len;
        const indices = try Bezier3x3Quad.createPatchIndices(RES_U, RES_V, allocator, count);
        errdefer allocator.free(indices);

        return .{
            .vertices = @as([*]BspDrawVertex, @ptrCast(vertices.ptr))[0..RES_U * RES_V * count],
            .indices = @as([*]i32, @ptrCast(indices.ptr))[0..(RES_U - 1) * (RES_V - 1) * 6 * count],
        };
    }

    pub fn deinit(self: TesselatedPatch, allocator: std.mem.Allocator) void {
        allocator.free(self.vertices);
        allocator.free(self.indices);
    }
};

pub const Bezier3x3Quad = struct {

    // API
    
    pub fn createPatchVertices(comptime RES_U: usize, comptime RES_V: usize, allocator: std.mem.Allocator, first_vert: i32, patch_width: i32, patch_height: i32, draw_vertices: BspDrawVertices) ![][RES_V][RES_U]BspDrawVertex {
        if (RES_U < 2 or RES_V < 2) {
            @compileError("U and V must be at least 2");
        }
        
        const control_points_set = try createControlPointsSet(allocator, first_vert, patch_width, patch_height, draw_vertices);
        defer allocator.free(control_points_set);
        const count = control_points_set.len;

        const generated_vertices_set = try allocator.alloc([RES_V][RES_U]BspDrawVertex, count);
        for(0..count) |i|{
            generated_vertices_set[i] = makeVertices(RES_U, RES_V, control_points_set[i]);
        }
        return generated_vertices_set;
    }

    pub fn createPatchIndices(comptime RES_U: usize, comptime RES_V: usize, allocator: std.mem.Allocator, count: usize) ![][(RES_U - 1) * (RES_V - 1) * 6]i32 {
        if (RES_U < 2 or RES_V < 2) {
            @compileError("U and V must be at least 2");
        }

        const result = try allocator.alloc([(RES_U - 1) * (RES_V - 1) * 6]i32, count);
        for (0..count) |i| {
            result[i] = makeIndices(RES_U, RES_V, RES_U * RES_V * i);
        }
        return result;
    }

    
    // Create Indices Functions

    // Compatible with Quake 3 BSP. 
    fn makeIndices(comptime RES_U: usize, comptime RES_V: usize, first_vert: usize) [(RES_U - 1) * (RES_V - 1) * 6]i32 {
        
        const quad_order = [6]usize { 0, 2, 1, 1, 2, 3 };
        const vertex_indices = [4]usize { 0, 1, RES_U, RES_U + 1 };

        var result: [(RES_U - 1) * (RES_V - 1) * 6]i32 = undefined;
        for(0..RES_V - 1) |v| {
            for(0..RES_U - 1) |u| {
                const vert_offset = first_vert + u + (v * RES_U);
                const result_offset = (v * (RES_U - 1) + u) * 6;

                for (0..6) |i| {
                    result[result_offset+i] = @intCast(vertex_indices[quad_order[i]] + vert_offset);
                }
            }
        }

        return result;
    }

    
    // Extract Vertices From Control Points Set Functions

    fn createControlPointsSet(allocator: std.mem.Allocator, first_vert: i32, patch_width: i32, patch_height: i32, draw_vertices: BspDrawVertices) ![][3][3]BspDrawVertex {
        const width = (@as(usize, @intCast(patch_width)) - 1) / 2;
        const height = (@as(usize, @intCast(patch_height)) - 1) / 2;

        const control_points_set = try allocator.alloc([3][3]BspDrawVertex, width * height);
        for (0..width) |w| {
            for (0..height) |h| {
                const u_offset = w * 2;
                const v_offset = h * 2;
                control_points_set[h * width + w] = makeControlPoints(first_vert, patch_width, draw_vertices, v_offset, u_offset);
            }
        }
        return control_points_set;
    }

    fn makeControlPoints(first_vert: i32, patch_width: i32, draw_vertices: BspDrawVertices, v_start: usize, u_start: usize) [3][3]BspDrawVertex {
        const offset = @as(usize, @intCast(first_vert)) + (v_start * @as(usize, @intCast(patch_width))) + u_start;
        const offset0 = offset;
        const offset1 = offset + @as(usize, @intCast(patch_width));
        const offset2 = offset + @as(usize, @intCast(patch_width)) * 2;
        const vertices = draw_vertices.vertices;
        return .{
            .{ vertices[offset0], vertices[offset0 + 1], vertices[offset0 + 2] },
            .{ vertices[offset1], vertices[offset1 + 1], vertices[offset1 + 2] },
            .{ vertices[offset2], vertices[offset2 + 1], vertices[offset2 + 2] },
        };
    }

    
    // Create Bezier Curved Surfaces Functions

    fn makeVertices(comptime RES_U: usize, comptime RES_V: usize, control_points: [3][3]BspDrawVertex) [RES_V][RES_U]BspDrawVertex {
        var vertices: [RES_V][RES_U]BspDrawVertex = undefined;
        const weights_grid = comptime createWeightsGrid(RES_U, RES_V);
        for (0..RES_U) |u| {
            for (0..RES_V) |v| {
                vertices[v][u] = makeDrawVertex(weights_grid[v][u], control_points);
            }
        }
        return vertices;
    }

    fn makeDrawVertex(weights: [3][3]f32, control_points: [3][3]BspDrawVertex) BspDrawVertex {
        var position = [3]f32{ 0, 0, 0 };
        var texcoord0 = [2]f32{ 0, 0 };
        var texcoord1 = [2]f32{ 0, 0 };
        var normal = [3]f32{ 0, 0, 0 };
        var color_f = [4]f32{ 0, 0, 0, 0 };

        for (0..3) |i| {
            for (0..3) |j| {
                const v = control_points[j][i];
                const w = weights[j][i];
                position[0] += v.position[0] * w;
                position[1] += v.position[1] * w;
                position[2] += v.position[2] * w;
                texcoord0[0] += v.texcoord0[0] * w;
                texcoord0[1] += v.texcoord0[1] * w;
                texcoord1[0] += v.texcoord1[0] * w;
                texcoord1[1] += v.texcoord1[1] * w;
                normal[0] += v.normal[0] * w;
                normal[1] += v.normal[1] * w;
                normal[2] += v.normal[2] * w;
                color_f[0] += @as(f32, @floatFromInt(v.color[0])) * w;
                color_f[1] += @as(f32, @floatFromInt(v.color[1])) * w;
                color_f[2] += @as(f32, @floatFromInt(v.color[2])) * w;
                color_f[3] += @as(f32, @floatFromInt(v.color[3])) * w;
            }
        }

        // NOTE: Normal's formula is not a Quake3's things. Check `tr_curve.c` `LerpDrawVert()` `MakeMeshNormals()`.
        return .{ .position = position, .texcoord0 = texcoord0, .texcoord1 = texcoord1, .normal = normal, .color = .{
            @as(u8, @intFromFloat(@round(color_f[0]))),
            @as(u8, @intFromFloat(@round(color_f[1]))),
            @as(u8, @intFromFloat(@round(color_f[2]))),
            @as(u8, @intFromFloat(@round(color_f[3]))),
        } };
    }

    
    // Weights Functions

    fn createWeightsGrid(comptime RES_U: usize, comptime RES_V: usize) [RES_V][RES_U][3][3]f32 {
        if (RES_U < 2 or RES_V < 2) {
            @compileError("U and V must be at least 2");
        }

        const u_stepunit: f32 = 1.0 / @as(f32, @floatFromInt(RES_U - 1));
        const v_stepunit: f32 = 1.0 / @as(f32, @floatFromInt(RES_V - 1));

        var weights_list: [RES_V][RES_U][3][3]f32 = undefined;

        for (0..RES_U) |iu| {
            const u = u_stepunit * @as(f32, @floatFromInt(iu));

            for (0..RES_V) |iv| {
                const v = v_stepunit * @as(f32, @floatFromInt(iv));
                weights_list[iv][iu] = getWeights(u, v);
            }
        }

        return weights_list;
    }

    fn getWeights(u: f32, v: f32) [3][3]f32 {
        return .{
            .{ w00(u, v), w10(u, v), w20(u, v) },
            .{ w01(u, v), w11(u, v), w21(u, v) },
            .{ w02(u, v), w12(u, v), w22(u, v) },
        };
    }

    inline fn w0(t: f32) f32 {
        return (1.0 - t) * (1.0 - t);
    }
    inline fn w1(t: f32) f32 {
        return 2 * t * (1.0 - t);
    }
    inline fn w2(t: f32) f32 {
        return t * t;
    }

    inline fn w00(u: f32, v: f32) f32 {
        return w0(u) * w0(v);
    }
    inline fn w01(u: f32, v: f32) f32 {
        return w0(u) * w1(v);
    }
    inline fn w02(u: f32, v: f32) f32 {
        return w0(u) * w2(v);
    }
    inline fn w10(u: f32, v: f32) f32 {
        return w1(u) * w0(v);
    }
    inline fn w11(u: f32, v: f32) f32 {
        return w1(u) * w1(v);
    }
    inline fn w12(u: f32, v: f32) f32 {
        return w1(u) * w2(v);
    }
    inline fn w20(u: f32, v: f32) f32 {
        return w2(u) * w0(v);
    }
    inline fn w21(u: f32, v: f32) f32 {
        return w2(u) * w1(v);
    }
    inline fn w22(u: f32, v: f32) f32 {
        return w2(u) * w2(v);
    }
};

/////////////////////////////////////////////////////////////////
// DEPRECATED? not sure... maybe ok to remove below when BspGlRenderer is gone.

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
                .triangle_soup, .planar => {
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
                },
                .patch => continue, // TODO: Add Patch Tesselation
                .flare => continue, // TODO: Add Flare
                .bad => continue,
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
// TODO: There's no Patch, Flare yet.
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

////////////////////////////////////////
// Patch Test

test "Bezier3x3Quad make indices" {
    const allocator = std.testing.allocator;
    const res_u = 3;
    const res_v = 2;
    const count = 2;
    const answer = [2][12]i32 {
        .{ 0, 3, 1, 1, 3, 4,
            1, 4, 2, 2, 4, 5 },
        .{ 0+6, 3+6, 1+6, 1+6, 3+6, 4+6,
            1+6, 4+6, 2+6, 2+6, 4+6, 5+6 }
    };

    const indices = try Bezier3x3Quad.createPatchIndices(res_u, res_v, allocator, count);
    defer allocator.free(indices);
    try std.testing.expectEqualSlices(i32, answer[0][0..], indices[0][0..]);
    try std.testing.expectEqualSlices(i32, answer[1][0..], indices[1][0..]);
}


test "Bezier3x3Quad creates correct vertex grids" {
    const allocator = std.testing.allocator;

    // ------------------------------------------------
    // 1. Prepare source vertices
    // ------------------------------------------------

    var source_vertices: [27]BspDrawVertex = undefined;

    // first_vert 이전에 다른 Vertex가 있다고 가정.
    // 잘못된 first_vert 처리를 발견하기 위한 Sentinel.
    for (0..2) |i| {
        source_vertices[i] = .{
            .position = .{ -100, -100, -100 },
            .texcoord0 = .{ 0, 0 },
            .texcoord1 = .{ 0, 0 },
            .normal = .{ 0, 0, 1 },
            .color = .{ 0, 0, 0, 255 },
        };
    }

    // 5x5 Control Points 생성.
    for (0..5) |v| {
        for (0..5) |u| {
            const fu: f32 = @floatFromInt(u);
            const fv: f32 = @floatFromInt(v);

            // 중간 Control Point에서 곡면이 휘도록 설정.
            const bulge_u: f32 = if (u % 2 == 1) 4.0 else 0.0;
            const bulge_v: f32 = if (v % 2 == 1) 8.0 else 0.0;

            source_vertices[2 + v * 5 + u] = .{
                .position = .{
                    fu,
                    fv,
                    bulge_u + bulge_v,
                },
                .texcoord0 = .{
                    fu / 4.0,
                    fv / 4.0,
                },
                .texcoord1 = .{
                    fu * 2.0,
                    fv * 3.0,
                },
                .normal = .{ 0, 0, 1 },
                .color = .{
                    @intCast(u * 20),
                    @intCast(v * 20),
                    77,
                    255,
                },
            };
        }
    }

    var draw_vertices: BspDrawVertices = undefined;
    draw_vertices.vertices = &source_vertices;

    // ------------------------------------------------
    // 2. Generate Bezier vertex grids
    // ------------------------------------------------

    const grids = try Bezier3x3Quad.createPatchVertices(
        3, // RES_U
        5, // RES_V
        allocator,
        2, // first_vert
        5, // patch_width
        5, // patch_height
        draw_vertices,
    );

    defer allocator.free(grids);

    // ------------------------------------------------
    // 3. Check patch count
    // ------------------------------------------------

    try std.testing.expectEqual(
        @as(usize, 4),
        grids.len,
    );

    // ------------------------------------------------
    // 4. Check generated vertices
    // ------------------------------------------------

    for (0..2) |patch_v| {
        for (0..2) |patch_u| {
            const patch_index = patch_v * 2 + patch_u;

            for (0..5) |v| {
                for (0..3) |u| {
                    const actual = grids[patch_index][v][u];

                    const tu: f32 =
                        @as(f32, @floatFromInt(u)) / 2.0;

                    const tv: f32 =
                        @as(f32, @floatFromInt(v)) / 4.0;

                    const expected_u =
                        @as(f32, @floatFromInt(patch_u * 2)) +
                        2.0 * tu;

                    const expected_v =
                        @as(f32, @floatFromInt(patch_v * 2)) +
                        2.0 * tv;

                    const expected_z =
                        4.0 * (2.0 * tu * (1.0 - tu)) +
                        8.0 * (2.0 * tv * (1.0 - tv));

                    // Position
                    try std.testing.expectApproxEqAbs(
                        expected_u,
                        actual.position[0],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        expected_v,
                        actual.position[1],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        expected_z,
                        actual.position[2],
                        0.0001,
                    );

                    // Texture Coordinate
                    try std.testing.expectApproxEqAbs(
                        expected_u / 4.0,
                        actual.texcoord0[0],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        expected_v / 4.0,
                        actual.texcoord0[1],
                        0.0001,
                    );

                    // Lightmap Coordinate
                    try std.testing.expectApproxEqAbs(
                        expected_u * 2.0,
                        actual.texcoord1[0],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        expected_v * 3.0,
                        actual.texcoord1[1],
                        0.0001,
                    );

                    // Normal
                    try std.testing.expectApproxEqAbs(
                        0.0,
                        actual.normal[0],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        0.0,
                        actual.normal[1],
                        0.0001,
                    );

                    try std.testing.expectApproxEqAbs(
                        1.0,
                        actual.normal[2],
                        0.0001,
                    );

                    // Color
                    const expected_red: u8 =
                        @intFromFloat(@round(expected_u * 20.0));

                    const expected_green: u8 =
                        @intFromFloat(@round(expected_v * 20.0));

                    try std.testing.expectEqual(
                        expected_red,
                        actual.color[0],
                    );

                    try std.testing.expectEqual(
                        expected_green,
                        actual.color[1],
                    );

                    try std.testing.expectEqual(
                        @as(u8, 77),
                        actual.color[2],
                    );

                    try std.testing.expectEqual(
                        @as(u8, 255),
                        actual.color[3],
                    );
                }
            }
        }
    }
}
