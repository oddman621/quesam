const std = @import("std");
const c = @import("raw.zig");

// Init and Deinit

var env: [*c]c.struct_JanetTable = null;

pub fn deinit() void {
    if (env != null) {
        c.janet_deinit();
        env = null;
    }
}

pub fn init() void {
    if (env == null) {
        _ = c.janet_init();
        env = c.janet_core_env(null);
        loadAllScripts();
    }
}

pub fn isInit() bool {
    return env != null;
}

fn loadAllScripts() void {
    _ = c.janet_dostring(
        env,
        @embedFile("script/parsing.janet"),
        null, null,
    );
}


// Internal Helper Function (General Purpose)

fn callFunction(name: []const u8, args: []const c.Janet) !c.Janet {
    const function_value = findFunctionValue(name) orelse return error.FunctionNotFound;
    c.janet_gcroot(function_value);
    defer _ = c.janet_gcunroot(function_value);

    const function = c.janet_unwrap_function(function_value);
    var result = c.janet_wrap_nil();

    const signal = c.janet_pcall(
        function,
        @intCast(args.len),
        args.ptr,
        &result,
        null,
    );

    if (signal != c.JANET_SIGNAL_OK) {
        return error.FunctionExecutionFailed;
    }

    return result;
}

fn findFunctionValue(name: []const u8) ?c.Janet {
    var function_value = c.janet_wrap_nil();

    const status = c.janet_dostring(
        env,
        name.ptr,
        "function-lookup",
        &function_value,
    );

    if (status != 0) {
        return null;
    }

    if (c.janet_type(function_value) != c.JANET_FUNCTION) {
        return null;
    }

    return function_value;
    
}


// Internal Helper Function (Quake Relative)

fn callParseEntities(entities_text: []const u8) !c.Janet {
    const arg0 = c.janet_string(
        entities_text.ptr,
        @intCast(entities_text.len),
    );
    return callFunction(
        "parse-entities",
        &.{ c.janet_wrap_string(arg0) }
    );
}

fn callParseQuakeShaders(shaders_text: []const u8) !c.Janet {
    const arg0 = c.janet_string(
        shaders_text.ptr,
        @intCast(shaders_text.len),
    );
    return callFunction(
        "parse-quake-shaders",
        &.{ c.janet_wrap_string(arg0) },
    );
}


// Public Functions to Use (Quake Relative)

pub const DirectiveUnparsed = [2][]const u8;
pub const StageUnparsed = []DirectiveUnparsed;
pub const EntityUnparsed = []DirectiveUnparsed;
pub const ShaderUnparsed = struct {
    name: [:0]const u8,
    directives: []DirectiveUnparsed,
    stages: []StageUnparsed,
};

pub fn parseQuakeShadersAlloc(allocator: std.mem.Allocator, shaders_text: []const u8) ![]ShaderUnparsed {
    const parsed = try callParseQuakeShaders(shaders_text);
    c.janet_gcroot(parsed);
    defer _ = c.janet_gcunroot(parsed);

    var shdrs: [*c]const c.Janet = null;
    var count: i32 = 0;

    const shdriv_ok = c.janet_indexed_view(
        parsed,
        &shdrs,
        &count,
    );
    if (shdriv_ok == 0) return error.ExpectedArray;
    
    var shaders = try allocator.alloc(ShaderUnparsed, @intCast(count));
    errdefer allocator.free(shaders);

    for (0..@intCast(count)) |i| {
        const janet_shdr = shdrs[i];

        var shdr: [*c]const c.Janet = null;
        var shdr_cnt: i32 = 0;
        const shdr_ok = c.janet_indexed_view(
            janet_shdr,
            &shdr,
            &shdr_cnt,
        );
        if (shdr_ok == 0) return error.ExpectedArray;

        const name_cstr = c.janet_unwrap_string(shdr[0]);
        const name_cstr_len = c.janet_string_length(name_cstr);
        //const value = c.janet_unwrap_array(shdr[1]);
        

        var items: [*c]const c.Janet = null;
        var item_count: i32 = 0;

        const iv_ok = c.janet_indexed_view(
            shdr[1],
            &items,
            &item_count,
        );
        if (iv_ok == 0) return error.ExpectedArray;
        
        var directives = std.ArrayList(DirectiveUnparsed).empty;
        defer directives.deinit(allocator);
        var stages = std.ArrayList(StageUnparsed).empty;
        defer stages.deinit(allocator);

        for (items[0..@intCast(item_count)]) |item| {

            var elems: [*c]const c.Janet = null;
            var elem_count: i32 = 0;

            const ev_ok = c.janet_indexed_view(
                item,
                &elems,
                &elem_count,
            );
            if (ev_ok == 0) return error.ExpectedArray;

            const is_directive = (elem_count == 2) and (c.janet_type(elems[0]) == c.JANET_STRING) and (c.janet_type(elems[1]) == c.JANET_STRING);
            if (is_directive) {
                const cstr_0 = c.janet_unwrap_string(elems[0]);
                const cstr_0_len = c.janet_string_length(cstr_0);
                const cstr_1 = c.janet_unwrap_string(elems[1]);
                const cstr_1_len = c.janet_string_length(cstr_1);
                try directives.append(
                    allocator,
                    .{
                        try allocator.dupe(u8, cstr_0[0..@intCast(cstr_0_len):0]),
                        try allocator.dupe(u8, cstr_1[0..@intCast(cstr_1_len):0]),
                    },
                );
            } else { // is Stage
                var stage = try allocator.alloc(DirectiveUnparsed, @intCast(elem_count));
                for(0..@intCast(elem_count)) |j| {
                    const elem = elems[j];

                    var directive: [*c]const c.Janet = null;
                    var dir_count: i32 = 0;

                    const siv_ok = c.janet_indexed_view(
                        elem,
                        &directive,
                        &dir_count,
                    );
                    if (siv_ok == 0) return error.ExpectedArray;
                    if (dir_count != 2) return error.ExpectedDirective;

                    const cstr_0 = c.janet_unwrap_string(directive[0]);
                    const cstr_0_len = c.janet_string_length(cstr_0);
                    const cstr_1 = c.janet_unwrap_string(directive[1]);
                    const cstr_1_len = c.janet_string_length(cstr_1);

                    stage[j] = .{
                        try allocator.dupe(u8, cstr_0[0..@intCast(cstr_0_len):0]),
                        try allocator.dupe(u8, cstr_1[0..@intCast(cstr_1_len):0]),
                    };
                }
                try stages.append(allocator, stage);
            }
        }
        
        shaders[i] = .{
            .name = try allocator.dupeSentinel(u8, name_cstr[0..@intCast(name_cstr_len)], 0),
            .directives = try allocator.dupe(DirectiveUnparsed, directives.items),
            .stages = try allocator.dupe(StageUnparsed, stages.items),
        };
    }
    
    return shaders;
}

pub fn parseEntitiesAlloc(allocator: std.mem.Allocator, entities_text: []const u8) ![]EntityUnparsed {
    const parsed = try callParseEntities(entities_text);
    c.janet_gcroot(parsed);
    defer _ = c.janet_gcunroot(parsed);
    
    var items: [*c]const c.Janet = null;
    var item_count: i32 = 0;

    const iv_ok = c.janet_indexed_view(
        parsed,
        &items,
        &item_count,
    );
    if (iv_ok == 0) return error.ExpectedArray;


    var entities = try allocator.alloc(
        EntityUnparsed,
        @intCast(item_count)
    );
    errdefer allocator.free(entities);
    
    for (0..@intCast(item_count)) |i| {
        const janet_entity = items[i];

        if (c.janet_type(janet_entity) != c.JANET_TABLE) {
            return error.ExpectedTable;
        }

        var kvs: [*c]const c.JanetKV = null;
        var count: i32 = 0;
        var capacity: i32 = 0;

        const dv_ok = c.janet_dictionary_view(
            janet_entity,
            &kvs,
            &count,
            &capacity,
        );

        if (dv_ok == 0) {
            return error.ExpectedDictionary;
        }

        var j: usize = 0;
        var entity = try allocator.alloc(DirectiveUnparsed, @intCast(count));
        errdefer {
            for (0..j) |k| {
                allocator.free(entity[k][0]);
                allocator.free(entity[k][1]);
            }
            allocator.free(entity);
        }

        var current: [*c]const c.JanetKV = null;
        while (true) {
            current = c.janet_dictionary_next(
                kvs,
                capacity,
                current,
            );
            if (current == null) break;

            const janet_key = current.*.key;
            const janet_value = current.*.value;

            const key_cstr = c.janet_unwrap_string(janet_key);
            const key_cstr_len = c.janet_string_length(key_cstr);
            const key = try allocator.dupe(u8, key_cstr[0..@intCast(key_cstr_len)]);
            errdefer allocator.free(key);
            const value_cstr = c.janet_unwrap_string(janet_value);
            const value_cstr_len = c.janet_string_length(value_cstr);
            const value = try allocator.dupe(u8, value_cstr[0..@intCast(value_cstr_len)]);
            errdefer allocator.free(value);

            entity[j] = .{ key, value };
            j += 1;
        }

        entities[i] = entity;
    }

    return entities;
}
