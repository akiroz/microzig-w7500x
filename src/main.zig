const std = @import("std");
const microzig = @import("microzig");
const CRG = microzig.chip.peripherals.CRG;
const GPIOC = microzig.chip.peripherals.GPIOC;
const AFC = microzig.chip.peripherals.AFC;

// pub const microzig_options = struct {
//     pub const interrupts = struct {
//         pub fn HardFault() void {
//             microzig.hang();
//         }
//         pub fn SysTick() void {}
//     };
// };

fn system_init() void {
    // Apply factory trim values
    const INFO_BGT: *volatile u32 = @ptrFromInt(0x0003FDB8);
    const INFO_OSC: *volatile u32 = @ptrFromInt(0x0003FDBC);
    const TRIM_BGT: *volatile u32 = @ptrFromInt(0x41001210);
    const TRIM_OSC: *volatile u32 = @ptrFromInt(0x41001004);
    TRIM_BGT.* = INFO_BGT.*;
    TRIM_OSC.* = INFO_OSC.*;
    // External clock 8MHz x 6 = 48MHz
    CRG.PLL_IFSR.modify(.{ .PLLIS = .{ .value = .External } });
    CRG.PLL_FCR.modify(.{ .M = 6, .N = 1, .OD = 0 });
}

pub fn main() !void {
    system_init();

    // PC5 = Blue LED
    GPIOC.OUTENSET.modify(.{ .ES5 = 1 });
    AFC.PC05.modify(.{ .AF = .{ .value = .GPIOC_5 } });

    while (true) {
        for (0..200000) |_| microzig.cpu.nop();
        GPIOC.DATAOUT.toggle(.{ .DAO5 = 1 });
    }
}
