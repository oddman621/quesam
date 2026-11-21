const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("quesam", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
    });

    const exe = b.addExecutable(.{
        .name = "quesam",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
            .imports = &.{
                .{ .name = "quesam", .module = mod },
            },
        }),
    });
    exe.root_module.link_libc = true; // For Janet Requirement
    b.installArtifact(exe);

    const raylib_dep = b.dependency("raylib_zig", .{
        .target = target,
        .optimize = optimize,
    });

    // Raylib
    const raylib = raylib_dep.module("raylib"); // main raylib module
    const raygui = raylib_dep.module("raygui"); // raygui module
    const raylib_artifact = raylib_dep.artifact("raylib"); // raylib C library
    raylib_artifact.root_module.addCMacro("SUPPORT_FILEFORMAT_JPG", "1");
    raylib_artifact.root_module.addCMacro("SUPPORT_FILEFORMAT_TGA", "1");

    exe.root_module.linkLibrary(raylib_artifact);
    exe.root_module.addImport("raylib", raylib);
    exe.root_module.addImport("raygui", raygui);

    
    // Janet
    exe.root_module.addIncludePath(b.path("vendor/janet"));
    exe.root_module.addCSourceFile(.{
        .file = b.path("vendor/janet/janet.c"),
        .flags = &.{"-std=c99"},
    });
    // Windows System Libraries for Janet
    if (target.result.os.tag == .windows) {
        exe.root_module.linkSystemLibrary("psapi", .{
            .use_pkg_config = .no,
        });

        exe.root_module.linkSystemLibrary("ws2_32", .{
            .use_pkg_config = .no,
        });

        exe.root_module.linkSystemLibrary("mswsock", .{
            .use_pkg_config = .no,
        });
    }

    
    const run_step = b.step("run", "Run the app");
    const run_cmd = b.addRunArtifact(exe);
    run_step.dependOn(&run_cmd.step);
    run_cmd.step.dependOn(b.getInstallStep());
    run_cmd.addPassthruArgs();

    const mod_tests = b.addTest(.{
        .root_module = mod,
    });
    const run_mod_tests = b.addRunArtifact(mod_tests);

    const exe_tests = b.addTest(.{
        .root_module = exe.root_module,
    });
    const run_exe_tests = b.addRunArtifact(exe_tests);

    const test_step = b.step("test", "Run tests");
    test_step.dependOn(&run_mod_tests.step);
    test_step.dependOn(&run_exe_tests.step);
}
