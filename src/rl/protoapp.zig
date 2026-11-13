const std = @import("std");
const rl = @import("raylib");

const Bsp = @import("../bsp.zig").Bsp;
const BspTestRenderer = @import("renderer.zig").BspTestRenderer;


pub fn runRaylibApp(allocator: std.mem.Allocator, io: std.Io) !void {
    const windowWidth = 1024;
    const windowHeight = 768;

    rl.initWindow(windowWidth, windowHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();
    rl.setTargetFPS(60);
    rl.disableCursor();
    rl.setExitKey(.null);

    const test_bsp = try Bsp.load(allocator, io, "assets/maps/q3dm0.bsp");
    defer test_bsp.unload();

    var camera = rl.Camera{
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
        
        // TODO: Make Your Own Free Camera
        rl.updateCamera(&camera, .free);
        if (rl.isKeyPressed(.z)) {
            camera.target = .init(0, 0, 0);
        }
        
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.dark_green);

        rl.beginMode3D(camera);
        defer rl.endMode3D();

        BspTestRenderer.rlglDrawBspOnlyVertexLighting(test_bsp);
    }
}


