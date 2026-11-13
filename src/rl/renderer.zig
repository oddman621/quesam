const Bsp = @import("../bsp.zig").Bsp;
const rl = @import("raylib");

pub const BspTestRenderer = struct {
    pub fn rlglDrawBspOnlyVertexLighting(bsp: Bsp) void {
        rl.gl.rlSetTexture(rl.gl.rlGetTextureIdDefault());
        rl.gl.rlBegin(rl.gl.rl_triangles);
        defer rl.gl.rlEnd();

        for (bsp.surfaces.surfaces) |surface| {
            switch (surface.surface_type) {
                .bad, .flare, .patch => continue,
                .planar, .triangle_soup => {},
            }
            if (@as(usize, @intCast(surface.num_indices)) % 3 != 0) continue;

            const firstVert: usize = @intCast(surface.first_vert);
            //const numVerts: usize = @intCast(surface.numVerts); // Can be used for verification.

            const firstIndex: usize = @intCast(surface.first_index);
            const numIndices: usize = @intCast(surface.num_indices);

            var i: usize = 0;
            while (i < numIndices) : (i += 3) {
                const offset = firstIndex + i;
                const indices = bsp.draw_indices.indices[offset..offset+3];
            
                var vertices = [3][3]f32 {
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[0]))].position,
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[1]))].position,
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[2]))].position,
                };
                
                // TODO: Temporary scaling, must be modified.
                for (&vertices) |*position| {
                    position[0] /= 32;
                    position[1] /= 32;
                    position[2] /= 32;
                }

                const colors = [3][4]u8 { // color[4] contains vertex lighting data.
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[0]))].color,
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[1]))].color,
                    bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[2]))].color,
                };

                for (vertices, colors) |vertex, color| {
                    rl.gl.rlColor4ub(color[0], color[1], color[2], color[3]);
                    rl.gl.rlVertex3f(vertex[0], vertex[1], vertex[2]);
                }
            }
        }
    }
};
