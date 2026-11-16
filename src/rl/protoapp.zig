const std = @import("std");
const rl = @import("raylib");

const BspRaw = @import("../bsp.zig").BspRaw;
const RlBsp = @import("bsp.zig").RlBsp;
//const renderer = @import("renderer.zig").rlgl;
const renderer = @import("renderer.zig");

const camera = @import("camera.zig");


pub fn runRaylibApp(allocator: std.mem.Allocator, io: std.Io) !void {
    const window_width = 1600;
    const window_height = 900;
    const game_width = 320 * 2;
    const game_height = 180 * 2;

    rl.initWindow(window_width, window_height, "quesam");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    const target = try rl.loadRenderTexture(game_width, game_height);
    defer rl.unloadRenderTexture(target);
    rl.setTextureFilter(target.texture, .point);

    const test_bsp = try RlBsp.load(allocator, io, "assets/maps/level.bsp");
    defer test_bsp.unload();
    test_bsp.setTextureFilter(.bilinear);

    // TODO: Create raylib-dependent Camera object?
    var cam = rl.Camera{
        .fovy = 45,
        .position = .init(10, 10, 10),
        .projection = .perspective,
        .up = .init(0, 0, 1),  // TODO: Inconsistency up vector between raylib and bsp.
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
            cam.target = .init(0, 0, -1);
        }
        
        renderer.renderRlBsp(.{
            .target = target,
            .camera = cam,
            .clear_color = .dark_green,
            .rl_bsp = test_bsp,
        });
    }
}

