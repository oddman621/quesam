const std = @import("std");
const rl = @import("raylib");
const bsp = @import("../bsp/raw.zig");
const bsp_render = @import("../bsp/render.zig");

const gl = rl.gl;
const BspRaw = bsp.BspRaw;
const Meshes = bsp_render.Meshes;
const Vertex = bsp_render.Vertex;

pub const BspGlRenderer = struct {
    vao: u32,
    vbo: u32,
    ebo: u32,

    shader: rl.Shader,
    shaderloc_projection: i32,
    shaderloc_view: i32,
    shaderloc_diffuse_map: i32,
    shaderloc_lightmap_map: i32,
    draw_elements_fn: DrawElementsFn,

    meshes: Meshes,

    shader_textures: []?rl.Texture, // "noshader" would be `null`.
    lightmap_textures: []rl.Texture,

    pub fn render(self: BspGlRenderer) void {
        gl.rlDrawRenderBatchActive();

        // TODO: Face cull inconsistency between raylib and bsp.
        // The code below is a workaround.
        gl.rlEnableBackfaceCulling();
        gl.rlSetCullFace(@backingInt(rl.gl.rlCullMode.rl_cull_face_front));
        defer {
            gl.rlSetCullFace(@backingInt(rl.gl.rlCullMode.rl_cull_face_back));
            gl.rlDisableBackfaceCulling();
        }

        const projection = gl.rlGetMatrixProjection();
        const view = gl.rlGetMatrixModelview();

        if (!gl.rlEnableVertexArray(self.vao)) std.debug.print("FAILED to EnableVertexArray(rl/renderer.zig:42)\n", .{});
        gl.rlEnableShader(self.shader.id);
        defer {
            gl.rlDisableShader();
            gl.rlDisableVertexArray();
        }

        gl.rlSetUniformMatrix(self.shaderloc_projection, projection);
        gl.rlSetUniformMatrix(self.shaderloc_view, view);
        const diffuse_slot: i32 = 0;
        const lightmap_slot: i32 = 1;
        rl.setShaderValue(self.shader, self.shaderloc_diffuse_map, &diffuse_slot, .sampler2d);
        rl.setShaderValue(self.shader, self.shaderloc_lightmap_map, &lightmap_slot, .sampler2d);

        defer {
            gl.rlActiveTextureSlot(lightmap_slot);
            gl.rlDisableTexture();

            gl.rlActiveTextureSlot(diffuse_slot);
            gl.rlDisableTexture();
        }
        const white_texture_id = gl.rlGetTextureIdDefault();
        const GL_TRIANGLES = 0x0004;
        const GL_UNSIGNED_INT = 0x1405;
        for (self.meshes.mesh_infos) |mesh_info| {
            const difftex_id = if (self.shader_textures[@intCast(mesh_info.shader_num)]) |difftex| difftex.id else continue; // Missing diffuse texture: skipping.
            const lighttex_id = if (mesh_info.lightmap_num != -1) self.lightmap_textures[@intCast(mesh_info.lightmap_num)].id else white_texture_id; // I don't know when lightmap is none... Set fullbright(white texture) in this case.

            gl.rlActiveTextureSlot(diffuse_slot);
            gl.rlEnableTexture(difftex_id);
            gl.rlActiveTextureSlot(lightmap_slot);
            gl.rlEnableTexture(lighttex_id);

            const ebo_byte_offset = mesh_info.first_index * @sizeOf(u32);
            self.draw_elements_fn(
                GL_TRIANGLES,
                @intCast(mesh_info.index_count),
                GL_UNSIGNED_INT,
                if (ebo_byte_offset != 0) @ptrFromInt(ebo_byte_offset) else null, // Since EBO is binded, this parameter is the byte offset of EBO.
            );
        }
    }

    pub fn init(allocator: std.mem.Allocator, io: std.Io, bsp_raw: BspRaw) !BspGlRenderer {
        const meshes = try Meshes.init(
            allocator,
            bsp_raw.surfaces,
            bsp_raw.draw_vertices,
            bsp_raw.draw_indices,
        );
        errdefer meshes.deinit(allocator);

        const vao = gl.rlLoadVertexArray();
        errdefer gl.rlUnloadVertexArray(vao);
        if (!gl.rlEnableVertexArray(vao)) return error.FailedToEnableVertexArray;

        const vbo = gl.rlLoadVertexBuffer(@ptrCast(meshes.vertices.ptr), @intCast(meshes.vertices.len * @sizeOf(Vertex)), false);
        errdefer gl.rlUnloadVertexBuffer(vbo);
        const ebo = gl.rlLoadVertexBufferElement(@ptrCast(meshes.indices.ptr), @intCast(meshes.indices.len * @sizeOf(u32)), false);
        errdefer gl.rlUnloadVertexBuffer(ebo);

        gl.rlEnableVertexBuffer(vbo);

        // Vertex attribute index order is followed by the code of raylib.

        gl.rlEnableVertexAttribute(0);
        gl.rlEnableVertexAttribute(1);
        gl.rlEnableVertexAttribute(2);
        gl.rlEnableVertexAttribute(3);
        gl.rlEnableVertexAttribute(5);

        // 0: Position
        gl.rlSetVertexAttribute(0, Vertex.len_position, gl.rl_float, false, Vertex.stride, Vertex.offset_position);

        // 1: Diffuse UV
        gl.rlSetVertexAttribute(1, Vertex.len_texcoord0, gl.rl_float, false, Vertex.stride, Vertex.offset_texcoord0);

        // 2: Normal
        gl.rlSetVertexAttribute(2, Vertex.len_normal, gl.rl_float, false, Vertex.stride, Vertex.offset_normal);

        // 3: Color
        gl.rlSetVertexAttribute(3, Vertex.len_color, gl.rl_unsigned_byte, true, Vertex.stride, Vertex.offset_color);

        // 5: Lightmap UV
        gl.rlSetVertexAttribute(5, Vertex.len_texcoord1, gl.rl_float, false, Vertex.stride, Vertex.offset_texcoord1);

        gl.rlEnableVertexBufferElement(ebo);
        gl.rlDisableVertexArray();

        // Load Textures
        const shaders = bsp_raw.shaders.shaders;
        var shader_textures = try allocator.alloc(?rl.Texture, shaders.len);
        @memset(shader_textures, null);
        errdefer {
            for (shader_textures) |maybe_texture| {
                if (maybe_texture) |texture| {
                    rl.unloadTexture(texture);
                }
            }
            allocator.free(shader_textures);
        }
        for (0..shaders.len) |i| {
            if (std.mem.eql(u8, shaders[i].path, "noshader")) {
                shader_textures[i] = null;
            } else {
                shader_textures[i] = try rl_texture.loadTextureFromBspShaderPath(io, shaders[i].path);
            }
        }

        // Load Lightmaps
        const lightmaps = bsp_raw.lightmaps.lightmaps;
        const lightmap_textures = try allocator.alloc(rl.Texture, lightmaps.len);
        var i: usize = 0;
        errdefer {
            for (0..i) |j| {
                rl.unloadTexture(lightmap_textures[j]);
            }
            allocator.free(lightmap_textures);
        }
        while (i < lightmaps.len) {
            lightmap_textures[i] = try rl.loadTextureFromImage(.{
                .data = &lightmaps[i],
                .format = .uncompressed_r8g8b8,
                .width = 128,
                .height = 128,
                .mipmaps = 1,
            });
            i += 1;
        }

        // GL Shader
        const shader = try loadBspRenderShader();
        errdefer rl.unloadShader(shader);

        const shaderloc_projection = rl.getShaderLocation(shader, "matProjection");
        const shaderloc_view = rl.getShaderLocation(shader, "matView");
        const shaderloc_diffuse_map = rl.getShaderLocation(shader, "diffuseMap");
        const shaderloc_lightmap_map = rl.getShaderLocation(shader, "lightmapMap");

        // Get glDrawElements function
        const draw_elements_fn_ptr = gl.rlGetProcAddress("glDrawElements") orelse return error.GlDrawElementsFunctionNotFound;
        const draw_elements_fn: DrawElementsFn = @ptrCast(@alignCast(draw_elements_fn_ptr));

        return .{
            .vao = vao,
            .vbo = vbo,
            .ebo = ebo,

            .shader = shader,
            .shaderloc_projection = shaderloc_projection,
            .shaderloc_view = shaderloc_view,
            .shaderloc_diffuse_map = shaderloc_diffuse_map,
            .shaderloc_lightmap_map = shaderloc_lightmap_map,

            .draw_elements_fn = draw_elements_fn,

            .meshes = meshes,
            .shader_textures = shader_textures,
            .lightmap_textures = lightmap_textures,
        };
    }

    pub fn deinit(self: BspGlRenderer, allocator: std.mem.Allocator) void {
        self.meshes.deinit(allocator);
        for (self.shader_textures) |texture| {
            if (texture) |t| {
                rl.unloadTexture(t);
            }
        }
        allocator.free(self.shader_textures);

        for (self.lightmap_textures) |texture| {
            rl.unloadTexture(texture);
        }
        rl.unloadShader(self.shader);
        allocator.free(self.lightmap_textures);

        gl.rlUnloadVertexBuffer(self.ebo);
        gl.rlUnloadVertexBuffer(self.vbo);
        gl.rlUnloadVertexArray(self.vao);
    }

    pub fn setTextureFilter(self: BspGlRenderer, filter: rl.TextureFilter) void {
        for (self.shader_textures) |maybe| {
            const texture = maybe orelse continue;
            rl.setTextureFilter(texture, filter);
        }
        for (self.lightmap_textures) |texture| {
            rl.setTextureFilter(texture, filter);
        }
    }

    pub fn loadBspRenderShader() !rl.Shader {
        return rl.loadShaderFromMemory(vertex_source, fragment_source);
    }

    pub const vertex_source =
        \\#version 330
        \\
        \\layout(location = 0) in vec3 vertexPosition;
        \\layout(location = 1) in vec2 vertexTexCoord;
        \\layout(location = 5) in vec2 vertexTexCoord2;
        \\
        \\uniform mat4 matProjection;
        \\uniform mat4 matView;
        \\
        \\out vec2 fragTexCoord;
        \\out vec2 fragLightmapCoord;
        \\
        \\void main()
        \\{
        \\    fragTexCoord = vertexTexCoord;
        \\    fragLightmapCoord = vertexTexCoord2;
        \\
        \\    gl_Position =
        \\        matProjection * matView *
        \\        vec4(vertexPosition, 1.0);
        \\}
    ;
    pub const fragment_source =
        \\#version 330
        \\
        \\in vec2 fragTexCoord;
        \\in vec2 fragLightmapCoord;
        \\
        \\uniform sampler2D diffuseMap;
        \\uniform sampler2D lightmapMap;
        \\
        \\out vec4 finalColor;
        \\
        \\void main()
        \\{
        \\    vec4 diffuse = texture(diffuseMap, fragTexCoord);
        \\    vec3 lightmap = texture(lightmapMap, fragLightmapCoord).rgb;
        \\
        \\    finalColor = vec4(
        \\        diffuse.rgb * lightmap,
        \\        diffuse.a
        \\    );
        \\}
    ;

    const DrawElementsFn = *const fn (
        mode: u32,
        count: i32,
        @"type": u32,
        indices: ?*const anyopaque,
    ) callconv(.c) void;
};

const rl_texture = struct {
    fn loadTextureRaw(data: []u8, width: i32, height: i32, format: rl.PixelFormat) !rl.Texture2D {
        const image = rl.Image{
            .data = data.ptr,
            .format = format,
            .width = width,
            .height = height,
            .mipmaps = 1,
        };

        return try rl.loadTextureFromImage(image);
    }

    fn loadTextureFromBspShaderPath(io: std.Io, shader_path: []const u8) !rl.Texture {
        var arena = std.heap.ArenaAllocator.init(std.heap.smp_allocator);
        defer arena.deinit();
        const filepath = try findImageFile(arena.allocator(), io, shader_path, "assets");
        if (filepath) |path| {
            const pathz = try arena.allocator().dupeSentinel(u8, path, 0);
            return rl.loadTexture(pathz);
        } else {
            std.debug.print("ERROR: failed to load image file: {s}\n", .{shader_path});
            return rl.loadTexture("assets/textures/_engine/missing.png");
            //return error.FileNotFound;
        }
    }

    fn findImageFile(allocator: std.mem.Allocator, io: std.Io, shader_path: []const u8, basepath: ?[]const u8) !?[]u8 {
        const dir_path = try std.Io.Dir.path.join(allocator, &.{ basepath orelse ".", std.Io.Dir.path.dirname(shader_path) orelse "." });
        defer allocator.free(dir_path);
        const basename = std.Io.Dir.path.basename(shader_path);
        const cwd = std.Io.Dir.cwd();
        std.debug.print("findImageFile.dir_path: {s}\n", .{dir_path});
        var dir = try cwd.openDir(io, dir_path, .{ .iterate = true });
        defer dir.close(io);

        const supported_extensions = [_][]const u8{ ".jpg", ".png", ".tga" };
        var it = dir.iterate();
        while (try it.next(io)) |entry| {
            if (entry.kind != .file) continue;
            if (!std.mem.startsWith(u8, entry.name, basename)) continue;
            if (entry.name[basename.len] != '.') continue;

            const ext = std.fs.path.extension(entry.name);
            for (supported_extensions) |sup_ext| {
                if (std.mem.eql(u8, ext, sup_ext)) {
                    return try std.Io.Dir.path.join(
                        allocator,
                        &.{ dir_path, entry.name },
                    );
                }
            }
        }
        return null;
    }
};
