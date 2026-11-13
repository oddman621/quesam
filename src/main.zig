const std = @import("std");
const quesam = @import("quesam");
const runRaylibApp = @import("rl/protoapp.zig").runRaylibApp;

pub fn main(init: std.process.Init) !void {
    try runRaylibApp(init.gpa, init.io);
}
