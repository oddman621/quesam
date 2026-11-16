const std = @import("std");
const BspRaw = @import("../bsp.zig").BspRaw;
const rl = @import("raylib");



pub const RlBsp = struct {
    allocator: std.mem.Allocator,
    shader_textures: []?rl.Texture, // no shader case exists. ("noshader" = null)
    lightmap_textures: []rl.Texture,
    bsp: BspRaw,

    pub fn load(allocator: std.mem.Allocator, io: std.Io, bsp_path: []const u8) !RlBsp {
        const bsp = try BspRaw.load(allocator, io, bsp_path);
        errdefer bsp.unload();
        
        const shaders = bsp.shaders.shaders;
        var shader_textures = try allocator.alloc(?rl.Texture, shaders.len);
        errdefer allocator.free(shader_textures);
        for (0..shaders.len) |i| {
            if(std.mem.eql(u8, shaders[i].path, "noshader")) {
                shader_textures[i] = null;
            } else {
                shader_textures[i] = try loadTexture(io, shaders[i].path);
            }
        }

        const lightmaps = bsp.lightmaps.lightmaps;
        const lightmap_textures = try allocator.alloc(rl.Texture, lightmaps.len);
        for (0..lightmaps.len) |i| {
            lightmap_textures[i] = try rl.loadTextureFromImage(.{
                .data = &lightmaps[i],
                .format = .uncompressed_r8g8b8,
                .width = 128,
                .height = 128,
                .mipmaps = 1,
            });
        }
        
        return .{
            .allocator = allocator,
            .shader_textures = shader_textures,
            .lightmap_textures = lightmap_textures,
            .bsp = bsp,
        };
    }

    pub fn unload(self: RlBsp) void {
        self.bsp.unload();
        
        for (self.shader_textures) |texture| {
            if (texture) |t| {
                rl.unloadTexture(t);
            }
        }
        self.allocator.free(self.shader_textures);

        for (self.lightmap_textures) |texture| {
            rl.unloadTexture(texture);
        }
        self.allocator.free(self.lightmap_textures);
    }

    pub fn setTextureFilter(self: RlBsp, filter: rl.TextureFilter) void {
        for (self.shader_textures) |maybe| {
            const texture = maybe orelse continue;
            rl.setTextureFilter(texture, filter);
        }
    }

    fn loadTextureRaw(data: []u8, width: i32, height: i32, format: rl.PixelFormat) !rl.Texture2D {
        const image = rl.Image {
            .data = data.ptr,
            .format = format,
            .width = width,
            .height = height,
            .mipmaps = 1,
        };

        return try rl.loadTextureFromImage(image);
    }

    fn loadTexture(io: std.Io, shader_path: []const u8) !rl.Texture {
        var arena = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
        defer arena.deinit();
        const filepath = try findImageFile(arena.allocator(), io, shader_path, "assets");
        if (filepath) |path| {
            const pathz = try arena.allocator().dupeSentinel(u8, path, 0);
            return rl.loadTexture(pathz);
        } else {
            std.debug.print("ERROR: failed to load image file: {s}\n", .{ shader_path });
            return rl.loadTexture("assets/textures/_engine/missing.png");
            //return error.FileNotFound;
        }
    }

    fn findImageFile(allocator: std.mem.Allocator, io: std.Io, shader_path: []const u8, basepath: ?[]const u8) !?[]u8 {
        const dir_path = try std.Io.Dir.path.join(
            allocator,
            &.{
                basepath orelse ".",
                std.Io.Dir.path.dirname(shader_path) orelse "."
            }
        );
        defer allocator.free(dir_path);
        const basename = std.Io.Dir.path.basename(shader_path);
        const cwd = std.Io.Dir.cwd();
        std.debug.print("findImageFile.dir_path: {s}\n", .{dir_path});
        var dir = try cwd.openDir(io, dir_path, .{ .iterate = true });
        defer dir.close(io);

        const supported_extensions = [_][]const u8 { ".jpg", ".png", ".tga" };
        var it = dir.iterate();
        while (try it.next(io)) |entry| {
            if (entry.kind != .file) continue;
            if (!std.mem.startsWith(u8, entry.name, basename)) continue;
            if (entry.name[basename.len] != '.') continue;

            const ext = std.fs.path.extension(entry.name);
            for(supported_extensions) |sup_ext| {
                if (std.mem.eql(u8, ext, sup_ext)) {
                    return try std.Io.Dir.path.join(
                        allocator,
                        &.{
                            dir_path,
                            entry.name
                        },
                    );
                }
            }
        }

        return null;
    }
};

