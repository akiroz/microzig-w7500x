const std = @import("std");

pub fn build(b: *std.Build) void {
    const microzig = @import("microzig").init(b, "microzig");

    const firmware = microzig.addFirmware(b, .{
        .name = "firmware",
        .target = .{
            .preferred_format = .elf,
            .chip = .{
                .name = "W7500x",
                .cpu = .cortex_m0,
                .memory_regions = &.{
                    .{ .offset = 0x00000000, .length = 128 * 1024, .kind = .flash },
                    .{ .offset = 0x20000000, .length = 15 * 1024, .kind = .ram },
                },
                .register_definition = .{ .zig = .{ .cwd_relative = "src/W7500x.zig" } },
            },
        },
        .optimize = .Debug,
        .source_file = .{ .cwd_relative = "src/main.zig" },
    });
    microzig.installFirmware(b, firmware, .{});
    microzig.installFirmware(b, firmware, .{ .format = .bin });
}
