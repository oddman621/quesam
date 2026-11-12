// Right now, only raylib(rlgl) renderer exist.
const Bsp = @import("bsp.zig").Bsp;
const rl = @import("raylib");

pub const BspTestRenderer = struct {
    pub fn rlglDrawBspOnlyVertexLighting(bsp: Bsp) void {
        rl.gl.rlSetTexture(rl.gl.rlGetTextureIdDefault());
        rl.gl.rlBegin(rl.gl.rl_triangles);
        defer rl.gl.rlEnd();

        // TODO: Face cull inconsistency between opengl and bsp.
        rl.gl.rlEnableBackfaceCulling();
        rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_front));

        for (bsp.surfaces.surfaces) |surface| {
            switch (surface.surfaceType) {
                .bad, .flare, .patch => continue,
                .planar, .triangle_soup => {},
            }
            if (@as(usize, @intCast(surface.numIndices)) % 3 != 0) continue;

            const firstVert: usize = @intCast(surface.firstVert);
            //const numVerts: usize = @intCast(surface.numVerts); // Can be used for verification.

            const firstIndex: usize = @intCast(surface.firstIndex);
            const numIndices: usize = @intCast(surface.numIndices);

            var i: usize = 0;
            while (i < numIndices) : (i += 3) {
                const offset = firstIndex + i;
                const indices = bsp.drawIndices.indices[offset..offset+3];
            
                var vertices = [3][3]f32 {
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[0]))].position,
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[1]))].position,
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[2]))].position,
                };
                
                // TODO: Temporary scaling, must be modified.
                for (&vertices) |*position| {
                    position[0] /= 32;
                    position[1] /= 32;
                    position[2] /= 32;
                }

                const colors = [3][4]u8 { // color[4] contains vertex lighting data.
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[0]))].color,
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[1]))].color,
                    bsp.drawVertices.vertices[firstVert + @as(usize, @intCast(indices[2]))].color,
                };

                for (vertices, colors) |vertex, color| {
                    rl.gl.rlColor4ub(color[0], color[1], color[2], color[3]);
                    rl.gl.rlVertex3f(vertex[0], vertex[1], vertex[2]);
                }
            }
        }
    }
};
