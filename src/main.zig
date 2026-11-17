const std = @import("std");
const quesam = @import("quesam");
const runRaylibApp = @import("rl/protoapp.zig").runRaylibApp;

pub fn main(init: std.process.Init) !void {
    try runRaylibApp(init.gpa, init.io);
}


// ZLS issue about module resolving: https://github.com/zigtools/zls/issues/3194 , https://github.com/zigtools/zls/issues/3277
// It may be fixed on ZLS 0.17.1 ?
// TODO: Delete below... until the issue is solved.
// const _cam = @import("rl/camera.zig");
