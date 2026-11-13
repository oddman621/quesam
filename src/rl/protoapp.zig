const std = @import("std");
const rl = @import("raylib");

const Bsp = @import("../bsp.zig").Bsp;
const BspTestRenderer = @import("renderer.zig").BspTestRenderer;

const camera = @import("camera.zig");


pub fn runRaylibApp(allocator: std.mem.Allocator, io: std.Io) !void {
    const window_width = 1600;
    const window_height = 900;

    const game_width = 320;
    const game_height = 240;

    const render_scale: f32 = @min(
        @as(f32, @floatFromInt(window_width)) / @as(f32, @floatFromInt(game_width)),
        @as(f32, @floatFromInt(window_height)) / @as(f32, @floatFromInt(game_height))
    );

    rl.initWindow(window_width, window_height, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    const target = try rl.loadRenderTexture(game_width, game_height);
    defer rl.unloadRenderTexture(target);
    rl.setTextureFilter(target.texture, .point);

    const test_bsp = try Bsp.load(allocator, io, "assets/maps/q3dm0.bsp");
    defer test_bsp.unload();

    var cam = rl.Camera{
        .fovy = 45,
        .position = .init(10, 10, 10),
        .projection = .perspective,
        .up = .init(0, 0, 1), // TODO: Inconsistency up vector between raylib and bsp.
        .target = .zero(),
    };

    // Set exit key for convenience
    rl.setExitKey(.escape);
    
    // Main game loop
    while (!rl.windowShouldClose()) {

        // Update
        const delta = rl.getFrameTime();
        rl.updateCamera(&cam, .custom);
        cam = camera.cameraFreeMove(cam, delta, 8, .{});
        cam = camera.cameraFreeLook(cam, .{});
        if (rl.isKeyPressed(.z)) {
            cam.target = .init(0, 0, 0);
        }

        
        // Draw (RenderTarget)
        {
            rl.beginTextureMode(target);
            defer rl.endTextureMode();
            rl.clearBackground(.dark_green);
            
            rl.beginMode3D(cam);
            defer rl.endMode3D();

            // TODO: Face cull inconsistency between opengl and bsp.
            rl.gl.rlEnableBackfaceCulling();
            rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_front));
            BspTestRenderer.rlglDrawBspOnlyVertexLighting(test_bsp);
            rl.gl.rlSetCullFace(@intFromEnum(rl.gl.rlCullMode.rl_cull_face_back));
            rl.gl.rlDisableBackfaceCulling();
        }

        // Draw
        {
            rl.beginDrawing();
            defer rl.endDrawing();
            rl.clearBackground(.black);

            rl.drawTexturePro(
                target.texture,
                .{
                    .x = 0, .y = 0,
                    .width = @floatFromInt(target.texture.width),
                    .height = @floatFromInt(-target.texture.height),
                },
                .{
                    .x = (window_width - @as(f32, @floatFromInt(game_width)) * render_scale) * 0.5,
                    .y = (window_height - @as(f32, @floatFromInt(game_height)) * render_scale) * 0.5,
                    .width = @as(f32, @floatFromInt(game_width)) * render_scale,
                    .height = @as(f32, @floatFromInt(game_height)) * render_scale,
                },
                .zero(),
                0,
                .white,
            );
        }
    }
}


