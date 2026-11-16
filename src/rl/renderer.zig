const BspRaw = @import("../bsp.zig").BspRaw;
const BspDrawVertex = @import("../bsp.zig").BspDrawVertex;
const rl = @import("raylib");
const RlBsp = @import("bsp.zig").RlBsp;


pub const RlBspRenderDescriptor = struct {
    target: rl.RenderTexture,
    camera: rl.Camera,
    clear_color: rl.Color,
    rl_bsp: RlBsp,
};

pub fn renderRlBsp(descriptor: RlBspRenderDescriptor) void {
    // DrawPass (RenderTarget)
    {
        rl.beginTextureMode(descriptor.target);
        defer rl.endTextureMode();

        rl.clearBackground(descriptor.clear_color);
            
        rl.beginMode3D(descriptor.camera);
        defer rl.endMode3D();
            
        drawRlBsp(descriptor.rl_bsp);
    }

    // DrawScreen
    drawTargetToScreenLetterBox(descriptor.target.texture);
}

fn drawRlBsp(rl_bsp: RlBsp) void {
    // TODO: Face cull inconsistency between raylib and bsp.
    // The code below is a workaround.
    rl.gl.rlEnableBackfaceCulling();
    rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_front));
    defer {
        rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_back));
        rl.gl.rlDisableBackfaceCulling();
    }

    const bsp = rl_bsp.bsp;

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

        const shader_index: usize = @intCast(surface.shader_num);
        const texture = rl_bsp.shader_textures[shader_index];
        if (texture) |t| {
            rl.gl.rlSetTexture(t.id);
        }
        defer rl.gl.rlSetTexture(rl.gl.rlGetTextureIdDefault());
        
        var i: usize = 0;
        while (i < numIndices) : (i += 3) {
            const offset = firstIndex + i;
            const indices = bsp.draw_indices.indices[offset..offset+3];

            const vertices = [3]BspDrawVertex{
                bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[0]))],
                bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[1]))],
                bsp.draw_vertices.vertices[firstVert + @as(usize, @intCast(indices[2]))],
            };

            for (vertices) |vertex| {
                const position = vertex.position;
                //const color = vertex.color;
                const texcoord0 = vertex.texcoord0;
                rl.gl.rlTexCoord2f(texcoord0[0], texcoord0[1]);
                //rl.gl.rlColor4ub(color[0], color[1], color[2], color[3]);
                rl.gl.rlColor4ub(255, 255, 255, 255); // fullbright for test
                rl.gl.rlVertex3f(position[0], position[1], position[2]);
            }
        }
    }
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

