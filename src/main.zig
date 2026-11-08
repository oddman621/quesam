const std = @import("std");
const rl = @import("raylib");

const bsp_renderer = @import("bsp_renderer");

pub fn main(init: std.process.Init) !void {
    _ = init;

    const screenWidth = 800;
    const screenHeight = 450;

    rl.initWindow(screenWidth, screenHeight, "raylib-zig [core] example - basic window");
    defer rl.closeWindow();
    rl.setTargetFPS(60);

    // Main game loop
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();
        rl.clearBackground(.white);
        rl.drawText("Congrats! You created your first window!", 190, 200, 20, .light_gray);
    }
}
