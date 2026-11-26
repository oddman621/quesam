const std = @import("std");
const bsp = @import("raw.zig");
const BspRaw = bsp.BspRaw;
const BspPlane = bsp.BspPlane;
const BspNode = bsp.BspNode;
const BspLeaf = bsp.BspLeaf;
const BspBrush = bsp.BspBrush;
const BspBrushSide = bsp.BspBrushSide;
const BspLeafBrush = bsp.BspLeafBrush;
const BspShader = bsp.BspShader;
//const BspModel = bsp.BspModel; // TODO: Model Collision
// TODO: Patch Collision

const CollisionLeafBrush = i32;

const CollisionLeafBrushes = struct {
    fn create(allocator: std.mem.Allocator, leafbrushes: []const BspLeafBrush) ![]CollisionLeafBrush {
        const length = leafbrushes.len;
        const cleafbrushes = try allocator.alloc(CollisionLeafBrush, length);
        for (0..length) |i| {
            cleafbrushes[i] = leafbrushes[i];
        }
        return cleafbrushes;
    }
    fn destroy(allocator: std.mem.Allocator, leafbrushes: []const CollisionLeafBrush) void {
        allocator.free(leafbrushes);
    }
};

const CollisionBrushSide = struct {
    plane: *const CollisionPlane,
    surface_flags: u32,
    shader_num: i32,
};

const CollisionBrushSides = struct {
    fn create(
        allocator: std.mem.Allocator,
        shaders: []const CollisionShader,
        planes: []const CollisionPlane,
        brushsides: []const BspBrushSide
    ) ![]CollisionBrushSide {
        const length = brushsides.len;
        const cbrushsides = try allocator.alloc(CollisionBrushSide, length);
        for(0..length) |i| {
            const plane_num: usize = @as(usize, @intCast(brushsides[i].plane_num));
            const shader_num: usize = @as(usize, @intCast(brushsides[i].shader_num));
            cbrushsides[i] = .{
                .plane = &planes[plane_num],
                .shader_num = brushsides[i].shader_num,
                .surface_flags = shaders[shader_num].surface_flags,
            };
        }
        return cbrushsides;
    }
    fn destroy(allocator: std.mem.Allocator, brushsides: []const CollisionBrushSide) void {
        allocator.free(brushsides);
    }
};

const CollisionBrush = struct {
    shader_num: i32,
    contents: u32,
    bounds: [2][3]f32,
    num_sides: i32,
    sides: []const CollisionBrushSide,
    check_count: i32 = 0,
};

const CollisionBrushes = struct {
    fn create(
        allocator: std.mem.Allocator,
        shaders: []const CollisionShader,
        brushsides: []const CollisionBrushSide,
        brushes: []const BspBrush
    ) ![]CollisionBrush {
        const length = brushes.len;
        const cbrushes = try allocator.alloc(CollisionBrush, length);
        for (0..length) |i| {
            const first_side = @as(usize, @intCast(brushes[i].first_side));
            const end_side = first_side + @as(usize, @intCast(brushes[i].num_sides));
            const sides = brushsides[first_side..end_side];
            const bounds = boundBrush(sides);
            const shader_num = @as(usize, @intCast(brushes[i].shader_num));
            const contents = shaders[shader_num].content_flags;

            cbrushes[i] = .{
                .shader_num = brushes[i].shader_num,
                .contents = contents,
                .bounds = bounds,
                .num_sides = brushes[i].num_sides,
                .sides = sides,
            };
        }
        return cbrushes;
    }
    fn boundBrush(brushsides: []const CollisionBrushSide) [2][3]f32 {
        return .{
            .{
                -brushsides[0].plane.dist,
                -brushsides[2].plane.dist,
                -brushsides[4].plane.dist,
            },
            .{
                
                brushsides[1].plane.dist,
                brushsides[3].plane.dist,
                brushsides[5].plane.dist,
            },
        };
    }
    fn destroy(allocator: std.mem.Allocator, brushes: []const CollisionBrush) void {
        allocator.free(brushes);
    }
};

const CollisionShader = struct {
    content_flags: u32,
    surface_flags: u32,
};

const CollisionShaders = struct {
    fn create(allocator: std.mem.Allocator, shaders: []const BspShader) ![]CollisionShader {
        const length = shaders.len;
        const cshaders = try allocator.alloc(CollisionShader, length);
        for(0..length) |i| {
            cshaders[i] = .{
                .content_flags = shaders[i].content_flags,
                .surface_flags = shaders[i].surface_flags,
            };
        }
        return cshaders;
    }
    fn destroy(allocator: std.mem.Allocator, shaders: []const CollisionShader) void {
        allocator.free(shaders);
    }
};

// const CollisionModel = struct {
//     mins: [3]f32,
//     maxs: [3]f32,
//     leaf: CollisionLeaf, // submodels don't reference the main tree (cm_local.h:48-51)
// };

const PlaneType = enum(u8) {
    x = 0,
    y = 1,
    z = 2,
    nonAxial,
};

const PlaneSignBits = packed struct(u8) {
    x: bool = false,
    y: bool = false,
    z: bool = false,
    _padding: u5 = 0,
};

const CollisionPlane = struct {
    normal: [3]f32,
    dist: f32,
    ty: PlaneType,
    signbits: PlaneSignBits,
};

const CollisionPlanes = struct {
    fn create(allocator: std.mem.Allocator, planes: []const BspPlane) ![]CollisionPlane {
        const length = planes.len;
        const cplanes = try allocator.alloc(CollisionPlane, length);
        for (0..length) |i| {
            const signbits: PlaneSignBits = .{
                .x = planes[i].normal[0] < 0,
                .y = planes[i].normal[1] < 0,
                .z = planes[i].normal[2] < 0,
            };

            const ty: PlaneType = blk: {
                if (planes[i].normal[0] == 1.0) break :blk .x;
                if (planes[i].normal[1] == 1.0) break :blk .y;
                if (planes[i].normal[2] == 1.0) break :blk .z;
                break :blk .nonAxial;
            };

            cplanes[i] = .{
                .normal = planes[i].normal,
                .dist = planes[i].distance,
                .signbits = signbits,
                .ty = ty,
            };
        }
        return cplanes;
    }
    
    fn destroy(allocator: std.mem.Allocator, planes: []const CollisionPlane) void {
        allocator.free(planes);
    }
};


const CollisionNode = struct {
    plane: *const CollisionPlane,
    front: i32,
    back: i32,
};

const CollisionNodes = struct {
    fn create(allocator: std.mem.Allocator, nodes: []const BspNode, planes: []const CollisionPlane) ![]CollisionNode {
        const length = nodes.len;
        const cnodes = try allocator.alloc(CollisionNode, length);
        for(0..length) |i| {
            cnodes[i] = .{
                .plane = &planes[@intCast(nodes[i].plane_num)],
                .front = nodes[i].front,
                .back = nodes[i].back,
            };
        }
        return cnodes;
    }
    
    fn destroy(allocator: std.mem.Allocator, nodes: []const CollisionNode) void {
        allocator.free(nodes);
    }
};

const CollisionLeaf = struct {
    cluster: i32,
    area: i32,
    first_leaf_brush: i32,
    num_leaf_brushes: i32,
    first_leaf_surface: i32,
    num_leaf_surfaces: i32,
};

const CollisionLeaves = struct {
    fn create(allocator: std.mem.Allocator, leaves: []const BspLeaf) ![]CollisionLeaf {
        const length = leaves.len;
        const cleaves = try allocator.alloc(CollisionLeaf, length);
        for (0..length) |i| {
            cleaves[i] = .{
                .area = leaves[i].area,
                .cluster = leaves[i].cluster,
                .first_leaf_brush = leaves[i].first_leaf_brush,
                .num_leaf_brushes = leaves[i].num_leaf_brushes,
                .first_leaf_surface = leaves[i].first_leaf_surface,
                .num_leaf_surfaces = leaves[i].num_leaf_surfaces,
            };
        }
        return cleaves;
    }
    fn destroy(allocator: std.mem.Allocator, leaves: []const CollisionLeaf) void {
        allocator.free(leaves);
    }
};


// Read-only Collision Data Collection. You ask to this, then this answers something.
pub const StaticCollisionMap = struct {
    planes: []const CollisionPlane,
    nodes: []const CollisionNode,
    leaves: []const CollisionLeaf,
    shaders: []const CollisionShader,
    leafbrushes: []const CollisionLeafBrush,
    brushsides: []const CollisionBrushSide,
    brushes: []const CollisionBrush,

    pub const BspData = struct {
        planes: []const BspPlane,
        nodes: []const BspNode,
        leaves: []const BspLeaf,
        shaders: []const BspShader,
        leafbrushes: []const BspLeafBrush,
        brushsides: []const BspBrushSide,
        brushes: []const BspBrush,

        pub fn fromBspRaw(bsp_raw: BspRaw) BspData {
            return .{
                .planes = bsp_raw.planes.planes,
                .nodes = bsp_raw.nodes.nodes,
                .leaves = bsp_raw.leaves.leaves,
                .shaders = bsp_raw.shaders.shaders,
                .leafbrushes = bsp_raw.leaf_brushes.leaf_brushes,
                .brushsides = bsp_raw.brush_sides.brush_sides,
                .brushes = bsp_raw.brushes.brushes,
            };
        }
    };

    pub fn init(
        allocator: std.mem.Allocator,
        bsp_data: BspData,
    ) !StaticCollisionMap {
        const cplanes = try CollisionPlanes.create(allocator, bsp_data.planes);
        errdefer CollisionPlanes.destroy(allocator, cplanes);
        const cnodes = try CollisionNodes.create(allocator, bsp_data.nodes, cplanes);
        errdefer CollisionNodes.destroy(allocator, cnodes);
        const cleaves = try CollisionLeaves.create(allocator, bsp_data.leaves);
        errdefer CollisionLeaves.destroy(allocator, cleaves);
        const cshaders = try CollisionShaders.create(allocator, bsp_data.shaders);
        errdefer CollisionShaders.destroy(allocator, cshaders);
        const cleafbrushes = try CollisionLeafBrushes.create(allocator, bsp_data.leafbrushes);
        errdefer CollisionLeafBrushes.destroy(allocator, cleafbrushes);
        const cbrushsides = try CollisionBrushSides.create(
            allocator,
            cshaders,
            cplanes,
            bsp_data.brushsides
        );
        errdefer CollisionBrushSides.destroy(allocator, cbrushsides);
        const cbrushes = try CollisionBrushes.create(
            allocator,
            cshaders,
            cbrushsides,
            bsp_data.brushes
        );
        
        return .{
            .planes = cplanes,
            .nodes = cnodes,
            .leaves = cleaves,
            .shaders = cshaders,
            .leafbrushes = cleafbrushes,
            .brushsides = cbrushsides,
            .brushes = cbrushes,
        };
    }

    pub fn deinit(map: StaticCollisionMap, allocator: std.mem.Allocator) void {
        CollisionPlanes.destroy(allocator, map.planes);
        CollisionNodes.destroy(allocator, map.nodes);
        CollisionLeaves.destroy(allocator, map.leaves);
        CollisionShaders.destroy(allocator, map.shaders);
        CollisionLeafBrushes.destroy(allocator, map.leafbrushes);
        CollisionBrushSides.destroy(allocator, map.brushsides);
        CollisionBrushes.destroy(allocator, map.brushes);
    }

    // common/surfaceflags.h
    pub const ContentsFlags = packed struct(u32) {
        solid: bool = false,
        _pad0: u2 = 0,
        lava: bool = false,

        slime: bool = false,
        water: bool = false,
        fog: bool = false,
        _pad1: u1 = 0,

        _pad2: u4 = 0,

        _pad3: u3 = 0,
        area_portal: bool = false,

        player_clip: bool = false,
        monster_clip: bool = false,
        teleporter: bool = false,
        jump_pad: bool = false,

        cluster_portal: bool = false,
        do_not_enter: bool = false,
        _pad4: u2 = 0,

        origin: bool = false,
        body: bool = false,
        corpse: bool = false,
        detail: bool = false,
        
        structural: bool = false,
        translucent: bool = false,
        trigger: bool = false,
        nodrop: bool = false,
    };

    pub const SurfaceFlags = packed struct(u32) {
        no_damage: bool = false,
        slick: bool = false,
        sky: bool = false,
        ladder: bool = false,

        no_impact: bool = false,
        no_marks: bool = false,
        flesh: bool = false,
        no_draw: bool = false,

        hint: bool = false,
        skip: bool = false,
        no_lightmap: bool = false,
        point_light: bool = false,

        metal_steps: bool = false,
        no_steps: bool = false,
        non_solid: bool = false,
        light_filter: bool = false,

        alpha_shadow: bool = false,
        nodlight: bool = false,
    };

    pub fn pointContents(self: StaticCollisionMap, p: [3]f32) ContentsFlags {
        //if (self.nodes.len == 0) return 0; // map is not loaded
        
        // TODO: model case not implemented
        const leaf_num = self.pointLeafNum(p);
        const leaf = self.leaves[leaf_num];

        const first: usize = @intCast(leaf.first_leaf_brush);
        const count: usize = @intCast(leaf.num_leaf_brushes);

        const brush_indices = self.leafbrushes[first .. first + count];
        var contents: u32 = 0;
        for (brush_indices) |brush_index| {
            const brush = self.brushes[@as(usize, @intCast(brush_index))];

            var inside = true;
            for (brush.sides) |side| {
                const d = dotProduct(side.plane.normal, p) - side.plane.dist;
                if (d > 0) {
                    inside = false;
                    break;
                }
            }
            if (inside) {
                contents |= brush.contents;
            }
        }
        return @bitCast(contents);
    }
    
    fn pointLeafNum(self: StaticCollisionMap, p: [3]f32) usize {
        var num: i32 = 0;
        while (num >= 0) {
            const node = self.nodes[@intCast(num)];
            const plane = node.plane;

            const d = switch (plane.ty) {
                .nonAxial => dotProduct(plane.normal, p) - plane.dist,
                .x, .y, .z => p[@intFromEnum(plane.ty)] - plane.dist,
            };

            if (d < 0) { 
                num = node.back;
            } else {
                num = node.front;
            }
        }
        return @intCast(-1 - num); // decode leaf index
    }

    inline fn dotProduct(p0: [3]f32, p1: [3]f32) f32 {
        return  (p0[0] * p1[0]) + (p0[1] * p1[1]) + (p0[2] * p1[2]);
    }
};


