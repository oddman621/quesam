const Bsp = @import("../bsp.zig").Bsp;
const rl = @import("raylib");



pub const rlgl = struct {

    pub const BspRenderDescriptor = struct {
        target: rl.RenderTexture,
        camera: rl.Camera,
        clear_color: rl.Color,
        bsp: Bsp,
    };

    pub fn renderBsp(descriptor: BspRenderDescriptor) void {

        // DrawPass (RenderTarget)
        {
            
            rl.beginTextureMode(descriptor.target);
            defer rl.endTextureMode();

            rl.clearBackground(descriptor.clear_color);


            // TODO: Inconsistency up vector between raylib and bsp.
            // The code below is a workaround.
            descriptor.camera.up = .init(0, 0, 1);
            
            rl.beginMode3D(descriptor.camera);
            defer rl.endMode3D();

            rlglDrawBspOnlyVertexLighting(descriptor.bsp);
        }

        // DrawScreen
        drawTargetToScreenLetterBox(descriptor.target.texture);
    }
    
    fn drawTargetToScreenLetterBox(target_texture: rl.Texture) void {
        
        const window_width: f32 = @floatFromInt(rl.getScreenWidth());
        const window_height: f32 = @floatFromInt(rl.getScreenHeight());
        const texture_width: f32 = @floatFromInt(target_texture.width);
        const texture_height: f32 = @floatFromInt(target_texture.height);
        const game_width: f32 = texture_width;
        const game_height: f32 = texture_height;
        const render_scale: f32 = @min(window_width / game_width,  window_height / game_height);
            
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.black);

        rl.drawTexturePro(
            target_texture,
            .{
                .x = 0, .y = 0,
                .width = texture_width,
                .height = -texture_height,
            },
            .{
                .x = (window_width - game_width * render_scale) * 0.5,
                .y = (window_height - game_height * render_scale) * 0.5,
                .width = game_width * render_scale,
                .height = game_height * render_scale,
            },
            .zero(),
            0,
            .white,
        );
    }


    fn rlglDrawBspOnlyVertexLighting(bsp: Bsp) void {

        // TODO: Face cull inconsistency between raylib and bsp.
        // The code below is a workaround.
        rl.gl.rlEnableBackfaceCulling();
        rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_front));
        defer {
            rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_back));
            rl.gl.rlDisableBackfaceCulling();
        }
        
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
                
                // TODO: Temporary scaling. BSP spatial data(including vertices) must already be scaled.
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
