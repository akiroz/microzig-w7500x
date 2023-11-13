const std = @import("std");
const microzig = @import("microzig");
const CRG = microzig.chip.peripherals.CRG;
const GPIOC = microzig.chip.peripherals.GPIOC;
const AFC = microzig.chip.peripherals.AFC;

fn config_clock() void {
    const INFO_BGT: *volatile u32 = @ptrFromInt(0x0003FDB8);
    const INFO_OSC: *volatile u32 = @ptrFromInt(0x0003FDBC);
    const TRIM_BGT: *volatile u32 = @ptrFromInt(0x41001210);
    const TRIM_OSC: *volatile u32 = @ptrFromInt(0x41001004);
    TRIM_BGT.* = INFO_BGT.*;
    TRIM_OSC.* = INFO_OSC.*;
    CRG.PLL_IFSR.modify(.{ .PLLIS = .{ .value = .External } });
    CRG.PLL_FCR.modify(.{ .M = 6 });
}

pub const microzig_options = struct {
    pub const interrupts = struct {
        pub fn HardFault() void {
            microzig.hang();
        }
    };
};

pub fn main() !void {
    config_clock();
    GPIOC.OUTENSET.modify(.{ .ES8 = 1 });
    AFC.PC08.modify(.{ .AF = .{ .value = .GPIOC_8 } });
    while (true) {
        for (0..10000) |_| microzig.cpu.nop();
        GPIOC.DATAOUT.toggle(.{ .DAO8 = 1 });
    }
}
