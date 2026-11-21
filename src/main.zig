const std = @import("std");
const quesam = @import("quesam");
const runRaylibApp = @import("rl/protoapp.zig").runRaylibApp;

pub fn main(init: std.process.Init) !void {
    //try runRaylibApp(init.gpa, init.io);
    try janetTest(init.gpa, init.io);
}



const j = @import("janet/janet.zig");
const jd = @import("janet/debug.zig");

fn janetTest(allocator: std.mem.Allocator, io: std.Io) !void {


    j.init();
    defer j.deinit();

    // Parse Entities
    
    const entities_text = try std.Io.Dir.cwd().readFileAllocOptions(
        io,
        "assets/test/q3dm3_entities.txt",
        allocator,
        .unlimited,
        .@"1",
        0
    );
    defer allocator.free(entities_text);
    
    const entities = try j.parseEntitiesAlloc(
        allocator,
        entities_text
    );
    defer {
        for (entities) |entity| {
            for (entity) |directive| {
                allocator.free(directive[0]);
                allocator.free(directive[1]);
            }
            allocator.free(entity);
        }
        allocator.free(entities);
    }
    
    for (entities, 0..) |entity, i| {
        //std.debug.print("Entity {d}\n", .{i});
        for (entity) |directive| {
            //std.debug.print("  {s}: {s}\n", .{ directive[0], directive[1] });
            _ = directive;
            _ = i;
        }
    }


    
    // Parse Quake Shader
    
    const quake_shader_text = try std.Io.Dir.cwd().readFileAllocOptions(
        io,
        "assets/test/sky.shader",
        allocator,
        .unlimited,
        .@"1",
        0
    );
    defer allocator.free(quake_shader_text);

    const shaders = try j.parseQuakeShadersAlloc(
        allocator,
        quake_shader_text,
    );
    defer {
        for (shaders) |shader| {
            allocator.free(shader.name);
            for (shader.directives) |directive| {
                allocator.free(directive[0]);
                allocator.free(directive[1]);
            }
            allocator.free(shader.directives);
            for(shader.stages) |stage| {
                for (stage) |directive| {
                    allocator.free(directive[0]);
                    allocator.free(directive[1]);
                }
                allocator.free(stage);
            }
            allocator.free(shader.stages);
        }
        allocator.free(shaders);
    }

    for (shaders) |shader| {
        std.debug.print("\"{s}\"\n", .{shader.name});
        for (shader.directives) |directive| {
            std.debug.print("  {s}: {s}\n", .{ directive[0], directive[1] });
        }
        for (shader.stages, 0..) |stage, i| {
            std.debug.print("  <Stage {d}>\n", .{i});
            for (stage) |directive| {
                std.debug.print("    {s}: {s}\n", .{ directive[0], directive[1] });
            }
        }
    }
}

// ZLS issue about module resolving: https://github.com/zigtools/zls/issues/3194 , https://github.com/zigtools/zls/issues/3277
// It may be fixed on ZLS 0.17.1 ?
// TODO: Delete below... until the issue is solved.
// const _cam = @import("rl/camera.zig");
// const _j = @import("janet/janet.zig");

