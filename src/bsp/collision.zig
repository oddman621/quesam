const std = @import("std");
const bsp = @import("raw.zig");
const BspPlane = bsp.BspPlane;
const BspNode = bsp.BspNode;
const BspLeaf = bsp.BspLeaf;
//const BspBrush = bsp.BspBrush;
//const BspBrushSide = bsp.BspBrushSide;
//const BspLeafBrush = bsp.BspLeafBrush;

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
    fn init(allocator: std.mem.Allocator, planes: []const BspPlane) ![]CollisionPlane {
        const length = planes.len;
        const cplanes = try allocator.alloc(CollisionPlane, length);
        for (0..length) |i| {
            const signbits: PlaneSignBits = .{
                .x = planes[i].normal[0] < 0,
                .y = planes[i].normal[1] < 0,
                .z = planes[i].normal[2] < 0,
            };

            // NOTE: Quake3's PlaneTypeForNormal does more than below. Check `code/bspc/map.c:101-122`.
            const ty: PlaneType = blk: {
                if (@abs(planes[i].normal[0]) == 1.0) break :blk .x;
                if (@abs(planes[i].normal[1]) == 1.0) break :blk .y;
                if (@abs(planes[i].normal[2]) == 1.0) break :blk .z;
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
    
    fn deinit(allocator: std.mem.Allocator, planes: []const CollisionPlane) void {
        allocator.free(planes);
    }
};


const CollisionNode = struct {
    plane: *const CollisionPlane,
    front: i32,
    back: i32,
};

const CollisionNodes = struct {
    fn init(allocator: std.mem.Allocator, nodes: []const BspNode, planes: []const CollisionPlane) ![]CollisionNode {
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
    
    fn deinit(allocator: std.mem.Allocator, nodes: []const CollisionNode) void {
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
    fn init(allocator: std.mem.Allocator, leaves: []const BspLeaf) ![]CollisionLeaf {
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
    fn deinit(allocator: std.mem.Allocator, leaves: []const CollisionLeaf) void {
        allocator.free(leaves);
    }
};


pub const StaticCollisionMap = struct {
    planes: []const CollisionPlane,
    nodes: []const CollisionNode,
    leaves: []const CollisionLeaf,

    pub fn init(
        allocator: std.mem.Allocator,
        planes: []const BspPlane,
        nodes: []const BspNode,
        leaves: []const BspLeaf,
    ) !StaticCollisionMap {
        const cplanes = try CollisionPlanes.init(allocator, planes);
        errdefer CollisionPlanes.deinit(allocator, cplanes);
        const cnodes = try CollisionNodes.init(allocator, nodes, cplanes);
        errdefer CollisionNodes.deinit(allocator, cnodes);
        const cleaves = try CollisionLeaves.init(allocator, leaves);
        return .{ .planes = cplanes, .nodes = cnodes, .leaves = cleaves };
    }

    pub fn deinit(map: StaticCollisionMap, allocator: std.mem.Allocator) void {
        CollisionPlanes.deinit(allocator, map.planes);
        CollisionNodes.deinit(allocator, map.nodes);
        CollisionLeaves.deinit(allocator, map.leaves);
    }

    
    pub fn isPointInside(self: StaticCollisionMap, p: [3]f32) bool {
        const num = pointLeafNum(p, self.nodes);
        const leaf = self.leaves[num];
        return leaf.cluster >= 0;
    }
};

fn pointLeafNum(p: [3]f32, nodes: []const CollisionNode) usize {
    var num: i32 = 0;
    while (num >= 0) {
        const node = nodes[@intCast(num)];
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
