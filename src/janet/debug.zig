const std = @import("std");
const j = @import("raw.zig");
const janet = @import("janet.zig");

pub fn parseAndPrintEntities(allocator: std.mem.Allocator, entities_text: []const u8) !void {
    const entities = try janet.parseEntitiesAlloc(
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
        std.debug.print("Entity {d}\n", .{i});
        for (entity) |directive| {
            std.debug.print("  {s}: {s}\n", .{ directive[0], directive[1] });
        }
    }
}

pub fn parseAndPrintShaders(allocator: std.mem.Allocator, shaders_text: []const u8) !void {
    const shaders = try janet.parseQuakeShadersAlloc(
        allocator,
        shaders_text,
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

pub fn dumpEntities(parsed: j.Janet) !void {
    var items: [*c]const j.Janet = null;
    var item_count: i32 = 0;

    const iv_ok = j.janet_indexed_view(
        parsed,
        &items,
        &item_count,
    );
    if (iv_ok == 0) return error.ExpectedArray;

    for (0..@intCast(item_count)) |i| {
        const entity = items[i];

        if (j.janet_type(entity) != j.JANET_TABLE) {
            return error.ExpectedTable;
        }

        var kvs: [*c]const j.JanetKV = null;
        var count: i32 = 0;
        var capacity: i32 = 0;

        const dv_ok = j.janet_dictionary_view(
            entity,
            &kvs,
            &count,
            &capacity,
        );

        if (dv_ok == 0) {
            return error.ExpectedDictionary;
        }

        std.debug.print(
            "\nEntity #{d} ({d} fields)\n",
            .{ i, count }
        );

        var current: [*c]const j.JanetKV = null;
        while (true) {
            current = j.janet_dictionary_next(
                kvs,
                capacity,
                current,
            );
            if (current == null) break;

            const pair = current.*;

            std.debug.print(
                "  {s}: {s}\n",
                .{ janetToString(pair.key).?, janetToString(pair.value).? },
            );
        }
    }
}

fn janetToString(value: j.Janet) ?[*c]const u8 {
    const description = j.janet_description(value);
    const string_value = j.janet_wrap_string(description);

    var bytes: [*c]const u8 = null;
    var len: i32 = 0;

    const ok = j.janet_bytes_view(
        string_value,
        &bytes,
        &len,
    );

    if (ok == 0) { return null; }
    else { return bytes; }
}
