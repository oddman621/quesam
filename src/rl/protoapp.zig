const std = @import("std");
const rl = @import("raylib");

const BspRaw = @import("../bsp/raw.zig").BspRaw;
const BspRenderer = @import("renderer.zig").DiffLightRenderer;

const Collision = @import("../bsp/collision.zig").StaticCollisionMap;

const camera = @import("camera.zig");

pub fn runRaylibApp(allocator: std.mem.Allocator, io: std.Io) !void {
    const window_width = 1920;
    const window_height = 1080;
    const game_width = 640;
    const game_height = 360;

    rl.initWindow(window_width, window_height, "bsp rendering");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    const target = try rl.loadRenderTexture(game_width, game_height);
    defer rl.unloadRenderTexture(target);
    rl.setTextureFilter(target.texture, .point);

    const bsp_raw = try BspRaw.load(allocator, io, "assets/maps/q3dm11.bsp");
    defer bsp_raw.unload(allocator);

    const renderer = try BspRenderer.init(allocator, io, bsp_raw);
    defer renderer.deinit(allocator);
    renderer.setLightmapFilter(.bilinear);
    renderer.setDiffTexFilter(.bilinear);
    renderer.setDiffTexFilter(.anisotropic_4x);

    const collision = try Collision.init(allocator, .fromBspRaw(bsp_raw));
    defer collision.deinit(allocator);

    // TODO: Create raylib-dependent Camera object?
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
        cam = camera.cameraFreeMove(cam, delta, 8 * 32, .{}); // TODO: BSP scale is too big.
        cam = camera.cameraFreeLook(cam, .{ .sensitivity = 10 });
        if (rl.isKeyPressed(.z)) {
            cam.position = .zero();
            //cam.target = .init(0, 0, -1);
            cam.target = .init(1, 0, 0);
        }

        // Draw Render Target
        {
            rl.beginTextureMode(target);
            defer rl.endTextureMode();

            rl.beginMode3D(cam);
            defer rl.endMode3D();

            rl.clearBackground(.dark_green);
            renderer.render(null, null);
        }

        // Draw Screen
        {
            rl.beginDrawing();
            defer rl.endDrawing();

            rl.clearBackground(.black);

            const target_texture = target.texture;
            const window_width_f: f32 = @floatFromInt(rl.getScreenWidth());
            const window_height_f: f32 = @floatFromInt(rl.getScreenHeight());
            const texture_width_f: f32 = @floatFromInt(target_texture.width);
            const texture_height_f: f32 = @floatFromInt(target_texture.height);
            const game_width_f: f32 = texture_width_f;
            const game_height_f: f32 = texture_height_f;
            const render_scale: f32 = @min(window_width_f / game_width_f, window_height_f / game_height_f);

            rl.drawTexturePro(
                target_texture,
                .{
                    .x = 0,
                    .y = 0,
                    .width = texture_width_f,
                    .height = -texture_height_f,
                },
                .{
                    .x = (window_width_f - game_width_f * render_scale) * 0.5,
                    .y = (window_height_f - game_height_f * render_scale) * 0.5,
                    .width = game_width_f * render_scale,
                    .height = game_height_f * render_scale,
                },
                .zero(),
                0,
                .white,
            );

            const contents_flags = collision.pointContents(cam.position.toFloatV().v);
            drawContentsFlags(contents_flags, 64);
        }
    }
}

fn drawContentsFlags(contents_flags: Collision.ContentsFlags, fontsize: i32) void {    
    var line: i32 = 0;
    if (contents_flags.solid) {
        rl.drawText("SOLID", 0, fontsize * line, fontsize, .beige);
        line += 1;
    }
    if (contents_flags.water) {
        rl.drawText("WATER", 0, fontsize * line, fontsize, .blue);
        line += 1;
    }
    if (contents_flags.fog) {
        rl.drawText("FOG", 0, fontsize * line, fontsize, .light_gray);
        line += 1;
    }
    if (contents_flags.slime) {
        rl.drawText("SLIME", 0, fontsize * line, fontsize, .green);
        line += 1;
    }
    if (contents_flags.lava) {
        rl.drawText("LAVA", 0, fontsize * line, fontsize, .red);
        line += 1;
    }
    if (contents_flags.teleporter) {
        rl.drawText("TELEPORTER", 0, fontsize * line, fontsize, .ray_white);
    }
}
