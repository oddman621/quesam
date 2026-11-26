const std = @import("std");
const rl = @import("raylib");
const bsp = @import("../bsp/raw.zig");
const bsp_render = @import("../bsp/render.zig");

const gl = rl.gl;
const BspRaw = bsp.BspRaw;
const BspShader = bsp.BspShader;
const Meshes = bsp_render.Meshes;
const Vertex = bsp_render.Vertex;
const Patch = bsp_render.TesselatedPatch;

const DrawElementsFn = *const fn (
    mode: u32,
    count: i32,
    @"type": u32,
    indices: ?*const anyopaque,
) callconv(.c) void;

fn getDrawElementsFunc() ?DrawElementsFn {
    const func = gl.rlGetProcAddress("glDrawElements");
    if(func) |f| {
        return @ptrCast(@alignCast(f));
    } else return null;
}

pub const GlTexLightShader = struct {
    handle: rl.Shader,
    loc_projection: i32,
    loc_view: i32,
    loc_diffuse_map: i32,
    loc_lightmap_map: i32,

    const diffuse_slot: i32 = 0;
    const lightmap_slot: i32 = 1;
    
    pub fn setShader(self: GlTexLightShader, projection: rl.Matrix, view: rl.Matrix) void {
        gl.rlEnableShader(self.handle.id);
        
        rl.setShaderValue(self.handle, self.loc_diffuse_map, &diffuse_slot, .sampler2d);
        rl.setShaderValue(self.handle, self.loc_lightmap_map, &lightmap_slot, .sampler2d);
        rl.setShaderValueMatrix(self.handle, self.loc_projection, projection);
        rl.setShaderValueMatrix(self.handle, self.loc_view, view);   
    }

    pub fn setDiffuse(_: GlTexLightShader, texture_id: u32) void {
        gl.rlActiveTextureSlot(diffuse_slot);
        gl.rlEnableTexture(texture_id);
    }
    
    pub fn setLightmap(_: GlTexLightShader, texture_id: u32) void {
        gl.rlActiveTextureSlot(lightmap_slot);
        gl.rlEnableTexture(texture_id);
    }

    pub fn unsetShader(_: GlTexLightShader) void {
        gl.rlDisableShader();
    }

    pub fn init() !GlTexLightShader {
        const handle = try rl.loadShaderFromMemory(
            shader_sources.get("texlight_vert"),
            shader_sources.get("texlight_frag")
        );

        const loc_projection = rl.getShaderLocation(handle, "matProjection");
        const loc_view = rl.getShaderLocation(handle, "matView");
        const loc_diffuse_map = rl.getShaderLocation(handle, "diffuseMap");
        const loc_lightmap_map = rl.getShaderLocation(handle, "lightmapMap");
        

        return .{
            .handle = handle,
            .loc_projection = loc_projection,
            .loc_view = loc_view,
            .loc_diffuse_map = loc_diffuse_map,
            .loc_lightmap_map = loc_lightmap_map,
        };
    }

    pub fn deinit(self: GlTexLightShader) void {
        rl.unloadShader(self.handle);
    }

    const shader_sources = std.StaticStringMap([:0]const u8).initComptime(.{
        .{ "texlight_vert",
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
        },
        .{ "texlight_frag",
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
        }
    });
};

const GlDiffLightDraw = struct {
    draw: GlDraw,

    diffuse_slot: i32 = 0,
    lightmap_slot: i32 = 1,
    diffuse_id: u32,
    lightmap_id: u32,

    fn render(self: GlDiffLightDraw, draw_elements_fn: DrawElementsFn) void {
        gl.rlActiveTextureSlot(self.diffuse_slot);
        gl.rlEnableTexture(self.diffuse_id);
        gl.rlActiveTextureSlot(self.lightmap_slot);
        gl.rlEnableTexture(self.lightmap_id);

        self.draw.render(draw_elements_fn);
    }

    fn init(vertices: []const Vertex, indices: []const u32, diffuse_id: u32, lightmap_id: u32) !GlDiffLightDraw {
        const draw = try GlDraw.init(vertices, indices);
        return .{
            .draw = draw,
            .diffuse_id = diffuse_id,
            .lightmap_id = lightmap_id,
        };
    }
    fn deinit(self: GlDiffLightDraw) void {
        self.draw.deinit();
    }
};


const GlDraw = struct {
    vao: u32,
    vbo: u32,
    ebo: u32,

    index_count: i32,

    fn render(self: GlDraw, draw_elements_fn: DrawElementsFn) void {
        const GL_TRIANGLES = 0x0004;
        const GL_UNSIGNED_INT = 0x1405;
        
        if(!gl.rlEnableVertexArray(self.vao)) return;
        defer gl.rlDisableVertexArray();

        draw_elements_fn(
            GL_TRIANGLES,
            self.index_count,
            GL_UNSIGNED_INT,
            null
        );
    }

    fn init(vertices: []const Vertex, indices: []const u32) !GlDraw {
        const vao = gl.rlLoadVertexArray();
        if (vao == 0) return error.FailedToLoadVertexArray;
        errdefer gl.rlUnloadVertexArray(vao);
        if (!gl.rlEnableVertexArray(vao)) return error.FailedToEnableVertexArray;
        defer gl.rlDisableVertexArray();

        const vbo = gl.rlLoadVertexBuffer(
            @ptrCast(vertices.ptr),
            @intCast(vertices.len * @sizeOf(Vertex)),
            false
        );
        if (vbo == 0) return error.FailedToLoadVertexBuffer;
        errdefer gl.rlUnloadVertexBuffer(vbo);
        const ebo = gl.rlLoadVertexBufferElement(
            @ptrCast(indices.ptr),
            @intCast(indices.len * @sizeOf(u32)),
            false
        );
        if (ebo == 0) return error.FailedToLoadVertexBuffer;
        errdefer gl.rlUnloadVertexBuffer(ebo);

        gl.rlEnableVertexBuffer(vbo);

        // Vertex attribute index order is followed by the code of raylib.

        gl.rlEnableVertexAttribute(0);
        gl.rlEnableVertexAttribute(1);
        gl.rlEnableVertexAttribute(2);
        gl.rlEnableVertexAttribute(3);
        gl.rlEnableVertexAttribute(5);

        // 0: Position
        gl.rlSetVertexAttribute(
            0,
            Vertex.len_position,
            gl.rl_float,
            false,
            Vertex.stride,
            Vertex.offset_position
        );

        // 1: Diffuse UV
        gl.rlSetVertexAttribute(
            1,
            Vertex.len_texcoord0,
            gl.rl_float, false,
            Vertex.stride,
            Vertex.offset_texcoord0
        );

        // 2: Normal
        gl.rlSetVertexAttribute(
            2,
            Vertex.len_normal,
            gl.rl_float, false,
            Vertex.stride,
            Vertex.offset_normal
        );

        // 3: Color
        gl.rlSetVertexAttribute(
            3,
            Vertex.len_color,
            gl.rl_unsigned_byte, true,
            Vertex.stride,
            Vertex.offset_color
        );

        // 5: Lightmap UV
        gl.rlSetVertexAttribute(
            5,
            Vertex.len_texcoord1,
            gl.rl_float, false,
            Vertex.stride,
            Vertex.offset_texcoord1
        );

        gl.rlEnableVertexBufferElement(ebo);

        return .{
            .vao = vao,
            .vbo = vbo,
            .ebo = ebo,
            .index_count = @intCast(indices.len),
        };
    }
    fn deinit(self: GlDraw) void {
        gl.rlUnloadVertexBuffer(self.ebo);
        gl.rlUnloadVertexBuffer(self.vbo);
        gl.rlUnloadVertexArray(self.vao);
    }
};

// Renderer for test. Just render. No Optimization. For now.
pub const DiffLightRenderer = struct {

    draws: []const GlDiffLightDraw,
    
    diffuse_textures: []const ?rl.Texture, // "noshader" is `null`, replaces with `default_texture` in this renderer.
    lightmap_textures: []const rl.Texture,
    
    draw_elements_fn: DrawElementsFn,

    shader: GlTexLightShader,

    pub fn setDiffTexFilter(self: DiffLightRenderer, filter: rl.TextureFilter) void {
        for (self.diffuse_textures) |difftex| {
            if (difftex) |t| {
                rl.setTextureFilter(t, filter);
            }
        }
    }

    pub fn setLightmapFilter(self: DiffLightRenderer, filter: rl.TextureFilter) void {
        for (self.lightmap_textures) |lighttex| {
            rl.setTextureFilter(lighttex, filter);
        }
    }

    pub fn render(self: DiffLightRenderer, view: ?rl.Matrix, projection: ?rl.Matrix) void {
        gl.rlDrawRenderBatchActive();

        // TODO: Face cull inconsistency between raylib and bsp.
        // The code below is a workaround.
        gl.rlEnableBackfaceCulling();
        gl.rlSetCullFace(@backingInt(rl.gl.rlCullMode.rl_cull_face_front));
        defer {
            gl.rlSetCullFace(@backingInt(rl.gl.rlCullMode.rl_cull_face_back));
            gl.rlDisableBackfaceCulling();
        }
        
        self.shader.setShader(
            projection orelse gl.rlGetMatrixProjection(),
            view orelse gl.rlGetMatrixModelview()
        );
        defer self.shader.unsetShader();

        for (self.draws) |draw| {
            self.shader.setDiffuse(draw.diffuse_id);
            self.shader.setLightmap(draw.lightmap_id);
            draw.render(self.draw_elements_fn);
        }
    }

    pub fn deinit(self: DiffLightRenderer, allocator: std.mem.Allocator) void {
        for (self.draws) |draw| draw.deinit();
        allocator.free(self.draws);
        for (self.diffuse_textures) |difftex| {
            if (difftex) |t| rl.unloadTexture(t);
        }
        allocator.free(self.diffuse_textures);
        for(self.lightmap_textures) |lighttex| {
            rl.unloadTexture(lighttex);
        }
        allocator.free(self.lightmap_textures);
        self.shader.deinit();
    }

    pub fn init(allocator: std.mem.Allocator, io: std.Io, bsp_raw: BspRaw) !DiffLightRenderer {
        const draw_elements_fn =
            getDrawElementsFunc() orelse return error.DrawElementsFuncNotFound;
        
        const white_texture_id = gl.rlGetTextureIdDefault();
        // TODO: add Missing Texture for "noshader"
        const diffuse_textures = try loadDiffuseTextures(allocator, io, bsp_raw.shaders.shaders);
        errdefer {
            for (diffuse_textures) |difftex| {
                if (difftex) |texture| rl.unloadTexture(texture);
            }
            allocator.free(diffuse_textures);
        }
        const lightmap_textures = try loadLightmapTexture(allocator, bsp_raw.lightmaps.lightmaps);
        errdefer {
            for (lightmap_textures) |texture| {
                rl.unloadTexture(texture);
            }
            allocator.free(lightmap_textures);
        }
        const draw_vertices = bsp_raw.draw_vertices.vertices;
        const draw_indices = bsp_raw.draw_indices.indices;

        var draws = std.ArrayList(GlDiffLightDraw).empty;
        defer draws.deinit(allocator);
        errdefer for(draws.items) |draw| draw.deinit();
        
        for (bsp_raw.surfaces.surfaces) |surface| {
            switch(surface.surface_type) {
                .triangle_soup, .planar => {
                    const shader_num = @as(usize, @intCast(surface.shader_num));
                    const lightmap_id = if (surface.lightmap_num < 0)
                        white_texture_id
                    else
                        lightmap_textures[@as(usize, @intCast(surface.lightmap_num))].id;
                    const first_vert = @as(usize, @intCast(surface.first_vert));
                    const vert_num = @as(usize, @intCast(surface.num_verts));
                    const first_index = @as(usize, @intCast(surface.first_index));
                    const index_num = @as(usize, @intCast(surface.num_indices));
                    const indices = try convertIndices(
                        allocator,
                        draw_indices[first_index .. first_index + index_num]
                    );
                    defer allocator.free(indices);
                    const diff_id = if (diffuse_textures[shader_num]) |t| t.id else white_texture_id;
                    
                    const draw = try GlDiffLightDraw.init(
                        draw_vertices[first_vert .. first_vert + vert_num],
                        indices,
                        diff_id,
                        lightmap_id,
                    );
                    errdefer draw.deinit();
                    try draws.append(allocator, draw);
                },
                .patch => {
                    const first_vert = surface.first_vert;
                    const patch_width = surface.patch_width;
                    const patch_height = surface.patch_height;
                    const patch = try Patch.init(
                        allocator, 5, 5,
                        bsp_raw.draw_vertices,
                        first_vert,
                        patch_width,
                        patch_height
                    );
                    defer patch.deinit(allocator);

                    
                    const shader_num = @as(usize, @intCast(surface.shader_num));
                    const lightmap_id = if (surface.lightmap_num < 0)
                        white_texture_id
                    else
                        lightmap_textures[@as(usize, @intCast(surface.lightmap_num))].id;
                    const diff_id = if (diffuse_textures[shader_num]) |t| t.id else white_texture_id;

                    const indices = try allocator.alloc(u32, patch.indices.len);
                    defer allocator.free(indices);
                    for (0..patch.indices.len) |i| {
                        indices[i] = @as(u32, @intCast(patch.indices[i]));
                    }

                    const draw = try GlDiffLightDraw.init(
                        patch.vertices,
                        indices,
                        diff_id,
                        lightmap_id,
                    );
                    errdefer draw.deinit();
                    try draws.append(allocator, draw);
                },
                .flare => {},
                .bad => continue,
            }
        }
        const shader = try GlTexLightShader.init();
        errdefer shader.deinit();
        
        return .{
            .shader = shader,
            .draws = try draws.toOwnedSlice(allocator),
            .diffuse_textures = diffuse_textures,
            .lightmap_textures = lightmap_textures,
            .draw_elements_fn = draw_elements_fn,
        };
    }

    fn convertIndices(allocator: std.mem.Allocator, draw_indices_slice: []i32) ![]u32 {
        const indices = try allocator.alloc(u32, draw_indices_slice.len);
        for (0..indices.len) |i| {
            indices[i] = @as(u32, @intCast(draw_indices_slice[i]));
        }
        return indices;
    }

    fn loadDiffuseTextures(allocator: std.mem.Allocator, io: std.Io, bsp_shaders: []BspShader) ![]?rl.Texture {
        var diffuse_textures = try allocator.alloc(?rl.Texture, bsp_shaders.len);
        @memset(diffuse_textures, null);
        errdefer {
            for (diffuse_textures) |maybe| if (maybe) |difftex|
                rl.unloadTexture(difftex);
            allocator.free(diffuse_textures);
        }
        for (0..diffuse_textures.len) |i| {
            if (std.mem.eql(u8, bsp_shaders[i].path, "noshader")) {
                diffuse_textures[i] = null;
            } else {
                diffuse_textures[i] = try rl_texture.loadTextureFromBspShaderPath(io, bsp_shaders[i].path);
            }
        }
        
        return diffuse_textures;
    }
    
    fn loadLightmapTexture(allocator: std.mem.Allocator, lightmaps: [][128][128][3]u8) ![]rl.Texture {
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
        return lightmap_textures;
    }
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


//////////////////////////////////////////////////////////////////////////////////////////////////////////////


// DEPRECATED: No use, but leave it for reference.
pub const BspGlRenderer = struct {
    vao: u32,
    vbo: u32,
    ebo: u32,

    shader: GlTexLightShader,
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
        gl.rlEnableShader(self.shader.handle.id);
        defer {
            gl.rlDisableShader();
            gl.rlDisableVertexArray();
        }

        gl.rlSetUniformMatrix(self.shader.loc_projection, projection);
        gl.rlSetUniformMatrix(self.shader.loc_view, view);
        const diffuse_slot: i32 = 0;
        const lightmap_slot: i32 = 1;
        rl.setShaderValue(self.shader.handle, self.shader.loc_diffuse_map, &diffuse_slot, .sampler2d);
        rl.setShaderValue(self.shader.handle, self.shader.loc_lightmap_map, &lightmap_slot, .sampler2d);

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

        // Get glDrawElements function
        const draw_elements_fn: DrawElementsFn = getDrawElementsFunc() orelse return error.GlDrawElementsFunctionNotFound;

        return .{
            .vao = vao,
            .vbo = vbo,
            .ebo = ebo,

            .shader = try .init(),

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
        allocator.free(self.lightmap_textures);

        rl.unloadShader(self.shader.handle);
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
};
