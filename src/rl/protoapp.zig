const std = @import("std");
const rl = @import("raylib");

const Bsp = @import("../bsp.zig").Bsp;
const renderer = @import("renderer.zig").rlgl;

const camera = @import("camera.zig");


pub fn runRaylibApp(allocator: std.mem.Allocator, io: std.Io) !void {
    const window_width = 1600;
    const window_height = 900;
    const game_width = 320;
    const game_height = 240;

    rl.initWindow(window_width, window_height, "quesam");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    const target = try rl.loadRenderTexture(game_width, game_height);
    defer rl.unloadRenderTexture(target);
    rl.setTextureFilter(target.texture, .point);

    const test_bsp = try Bsp.load(allocator, io, "assets/maps/q3dm0.bsp");
    defer test_bsp.unload();

    // TODO: Create raylib-dependent Camera object?
    var cam = rl.Camera{
        .fovy = 45,
        .position = .init(10, 10, 10),
        .projection = .perspective,
        .up = .init(0, 1, 0),
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
            cam.position = .zero();
            cam.target = .init(0, 0, -1);
        }

        
        
        renderer.renderBsp(.{
            .target = target,
            .camera = cam,
            .clear_color = .dark_green,
            .bsp = test_bsp,
        });
    }
}


