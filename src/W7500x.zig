const micro = @import("microzig");
const mmio = micro.mmio;

pub const devices = struct {
    ///  The IOP (Internet Offload Processor) W7500P is the one-chip solution which integrates an ARM Cortex-M0, 128KB Flash and hardwired TCP/IP core & PHY for various embedded application platform especially requiring ‘Internet of things’. The TCP/IP core is a market-proven hardwired TCP/IP stack with an integrated Ethernet MAC. The Hardwired TCP/IP stack supports the TCP, UDP, IPv4, ICMP, ARP, IGMP and PPPoE which has been used in various applications for years. W7500P suits best for users who need Internet connectivity for application.
    pub const W7500x = struct {
        pub const properties = struct {
            pub const @"cpu.endian" = "little";
            pub const @"cpu.mpuPresent" = "false";
            pub const @"cpu.revision" = "r0p0";
            pub const @"cpu.name" = "CM0";
            pub const @"cpu.nvicPrioBits" = "2";
            pub const @"cpu.vendorSystickConfig" = "false";
            pub const @"cpu.fpuPresent" = "false";
        };

        pub const VectorTable = extern struct {
            const Handler = micro.interrupt.Handler;
            const unhandled = micro.interrupt.unhandled;

            initial_stack_pointer: u32,
            Reset: Handler = unhandled,
            NMI: Handler = unhandled,
            HardFault: Handler = unhandled,
            reserved2: [7]u32 = undefined,
            SVCall: Handler = unhandled,
            reserved10: [2]u32 = undefined,
            PendSV: Handler = unhandled,
            SysTick: Handler = unhandled,
            ///  SSP 0 Interrupt
            SSP0: Handler = unhandled,
            ///  SSP 1 Interrupt
            SSP1: Handler = unhandled,
            ///  UART 0 Interrupt
            UART0: Handler = unhandled,
            ///  UART 1 Interrupt
            UART1: Handler = unhandled,
            ///  UART 2 Interrupt
            UART2: Handler = unhandled,
            reserved19: [2]u32 = undefined,
            ///  Port 0 combined Interrupt
            PORT0: Handler = unhandled,
            ///  Port 1 combined Interrupt
            PORT1: Handler = unhandled,
            ///  Port 2 combined Interrupt
            PORT2: Handler = unhandled,
            ///  Port 3 combined Interrupt
            PORT3: Handler = unhandled,
            ///  DMA combined Interrupt
            DMA: Handler = unhandled,
            ///  Dual Timer 0 Interrupt
            DUALTIMER0: Handler = unhandled,
            ///  Dual Timer 1 Interrupt
            DUALTIMER1: Handler = unhandled,
            ///  PWM 0 Interrupt
            PWM0: Handler = unhandled,
            ///  PWM 1 Interrupt
            PWM1: Handler = unhandled,
            ///  PWM 2 Interrupt
            PWM2: Handler = unhandled,
            ///  PWM 3 Interrupt
            PWM3: Handler = unhandled,
            ///  PWM 4 Interrupt
            PWM4: Handler = unhandled,
            ///  PWM 5 Interrupt
            PWM5: Handler = unhandled,
            ///  PWM 6 Interrupt
            PWM6: Handler = unhandled,
            ///  PWM 7 Interrupt
            PWM7: Handler = unhandled,
            ///  RTC Interrupt
            RTC: Handler = unhandled,
            ///  ADC Interrupt
            ADC: Handler = unhandled,
        };

        pub const peripherals = struct {
            pub const WDT = @as(*volatile types.peripherals.WDT, @ptrFromInt(0x40000000));
            pub const DUALTIMER0_0 = @as(*volatile types.peripherals.DUALTIMER0_0, @ptrFromInt(0x40001000));
            pub const DUALTIMER0_1 = @as(*volatile types.peripherals.DUALTIMER0_0, @ptrFromInt(0x40001020));
            pub const DUALTIMER1_0 = @as(*volatile types.peripherals.DUALTIMER0_0, @ptrFromInt(0x40002000));
            pub const DUALTIMER1_1 = @as(*volatile types.peripherals.DUALTIMER0_0, @ptrFromInt(0x40002020));
            pub const PWM0 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005000));
            pub const PWM1 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005100));
            pub const PWM2 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005200));
            pub const PWM3 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005300));
            pub const PWM4 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005400));
            pub const PWM5 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005500));
            pub const PWM6 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005600));
            pub const PWM7 = @as(*volatile types.peripherals.PWM0, @ptrFromInt(0x40005700));
            pub const PWM = @as(*volatile types.peripherals.PWM, @ptrFromInt(0x40005800));
            pub const UART2 = @as(*volatile types.peripherals.UART2, @ptrFromInt(0x40006000));
            pub const RNG = @as(*volatile types.peripherals.RNG, @ptrFromInt(0x40007000));
            pub const SSP0 = @as(*volatile types.peripherals.SSP0, @ptrFromInt(0x4000a000));
            pub const SSP1 = @as(*volatile types.peripherals.SSP0, @ptrFromInt(0x4000b000));
            pub const UART0 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0x4000c000));
            pub const UART1 = @as(*volatile types.peripherals.UART0, @ptrFromInt(0x4000d000));
            pub const RTC = @as(*volatile types.peripherals.RTC, @ptrFromInt(0x4000e000));
            pub const SYSCFG = @as(*volatile types.peripherals.SYSCFG, @ptrFromInt(0x4001f000));
            pub const ADC = @as(*volatile types.peripherals.ADC, @ptrFromInt(0x41000000));
            pub const CRG = @as(*volatile types.peripherals.CRG, @ptrFromInt(0x41001000));
            pub const AFC = @as(*volatile types.peripherals.AFC, @ptrFromInt(0x41002000));
            pub const PAD_A = @as(*volatile types.peripherals.PAD_A, @ptrFromInt(0x41003000));
            pub const PAD_B = @as(*volatile types.peripherals.PAD_A, @ptrFromInt(0x41003040));
            pub const PAD_C = @as(*volatile types.peripherals.PAD_A, @ptrFromInt(0x41003080));
            pub const PAD_D = @as(*volatile types.peripherals.PAD_A, @ptrFromInt(0x410030c0));
            pub const DMA = @as(*volatile types.peripherals.DMA, @ptrFromInt(0x41004000));
            pub const GPIOA = @as(*volatile types.peripherals.GPIOA, @ptrFromInt(0x42000000));
            pub const GPIOB = @as(*volatile types.peripherals.GPIOA, @ptrFromInt(0x43000000));
            pub const GPIOC = @as(*volatile types.peripherals.GPIOA, @ptrFromInt(0x44000000));
            pub const GPIOD = @as(*volatile types.peripherals.GPIOA, @ptrFromInt(0x45000000));
        };
    };
};

pub const types = struct {
    pub const peripherals = struct {
        pub const WDT = extern struct {
            ///  Watchdog timer Load register
            LOAD: mmio.Mmio(packed struct(u32) {
                ///  Watchdog timer Load
                WLR: u32,
            }),
            ///  Watchdog timer Value register
            VALUE: mmio.Mmio(packed struct(u32) {
                ///  Watchdog timer Value
                WVR: u32,
            }),
            ///  Watchdog timer Control register
            CONTROL: mmio.Mmio(packed struct(u32) {
                ///  Interrupt Enable
                IEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Reset Request Enable
                REN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u30,
            }),
            ///  Watchdog timer Clear Interrupt register
            INTCLR: mmio.Mmio(packed struct(u32) {
                ///  Watchdog timer Interrupt Clear
                WIC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                padding: u31,
            }),
            ///  Watchdog timer Raw Interrupt Status register
            RIS: mmio.Mmio(packed struct(u32) {
                ///  Watchdog timer Raw Interrupt Status
                RIS: u1,
                padding: u31,
            }),
            ///  Watchdog timer Masked Interrupt Status register
            MIS: mmio.Mmio(packed struct(u32) {
                ///  Watchdog timer Masked Interrupt Status
                MIS: u1,
                padding: u31,
            }),
            reserved3072: [3048]u8,
            ///  Watchdog timer Lock register
            LOCK: mmio.Mmio(packed struct(u32) {
                ///  Register Write Enable status
                WES: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotLocked = 0x0,
                        Locked = 0x1,
                    },
                },
                ///  ERW[31:1] bits (Enable Register Writes)
                ERW: packed union {
                    raw: u31,
                    value: enum(u31) {
                        Lock = 0x0,
                        UnLock = 0x1acce551,
                        _,
                    },
                },
            }),
        };

        pub const DUALTIMER0_0 = extern struct {
            ///  Timer Load register
            LOAD: mmio.Mmio(packed struct(u32) {
                ///  Timer Load
                TLR: u32,
            }),
            ///  Timer Counter Current Value register
            VALUE: mmio.Mmio(packed struct(u32) {
                ///  Timer Value
                TVR: u32,
            }),
            ///  Timer Control register
            CONTROL: mmio.Mmio(packed struct(u32) {
                ///  One-shot Count
                OC: u1,
                ///  Timer Size
                TS: u1,
                ///  Timer Prescale
                TP: u2,
                reserved5: u1,
                ///  Interrupt Enable
                IE: u1,
                ///  Timer Mode
                TM: u1,
                ///  Timer Enable
                TE: u1,
                padding: u24,
            }),
            ///  Timer Interrupt Clear register
            INTCLR: mmio.Mmio(packed struct(u32) {
                ///  Interrupt Clear
                TIC: u1,
                padding: u31,
            }),
            ///  Timer Raw Interrupt Status register
            RIS: mmio.Mmio(packed struct(u32) {
                ///  Raw Interrupt Status flag
                RIS: u1,
                padding: u31,
            }),
            ///  Timer Masked Interrupt Status register
            MIS: mmio.Mmio(packed struct(u32) {
                ///  Masked Interrupt Status flag
                MIS: u1,
                padding: u31,
            }),
            ///  Background Load register
            BGLOAD: mmio.Mmio(packed struct(u32) {
                ///  Background Load
                BGL: u32,
            }),
            reserved128: [100]u8,
            ///  Clock enable register
            CE: u32,
        };

        pub const SSP0 = extern struct {
            ///  Control register 0
            CR0: mmio.Mmio(packed struct(u32) {
                ///  Data size select
                DSS: u4,
                ///  Frame Format
                FRF: u2,
                ///  SSPCLKOUT polarity
                SPO: u1,
                ///  SSPCLKOUT phase
                SPH: u1,
                ///  Serial clock rate
                SCR: u8,
                padding: u16,
            }),
            ///  Control register 1
            CR1: mmio.Mmio(packed struct(u32) {
                ///  Loop back mode
                LBM: u1,
                ///  Synchronous serial port enable
                SSE: u1,
                ///  Master or Slave mode select
                MS: u1,
                ///  Slave-mode output disable
                SOD: u1,
                padding: u28,
            }),
            ///  Data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Transmit/Receive FIFO
                DATA: u16,
                padding: u16,
            }),
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  Transmit FIFO empty
                TFE: u1,
                ///  Transmit FIFO not full
                TNF: u1,
                ///  Receive FIFO not empty
                RNE: u1,
                ///  Receive FIFO full
                RFF: u1,
                ///  SSP busy flag
                BSY: u1,
                padding: u27,
            }),
            ///  Clock prescale register
            CPSR: mmio.Mmio(packed struct(u32) {
                ///  Clock prescale divisor
                CPSDVSR: u8,
                padding: u24,
            }),
            ///  Interrupt mask set or clear register
            IMSC: mmio.Mmio(packed struct(u32) {
                ///  Receive overrun interrupt mask
                RORIM: u1,
                ///  Receive timeout interrupt mask
                RTIM: u1,
                ///  Receive FIFO interrupt mask
                RXIM: u1,
                ///  Transmit FIFO interrupt mask
                TXIM: u1,
                padding: u28,
            }),
            ///  Raw interrupt status register
            RIS: mmio.Mmio(packed struct(u32) {
                ///  Receive overrun interrupt status
                RORRIS: u1,
                ///  Receive timeout interrupt status
                RTRIS: u1,
                ///  Receive FIFO interrupt status
                RXRIS: u1,
                ///  Transmit FIFO interrupt status
                TXRIS: u1,
                padding: u28,
            }),
            ///  Masked interrupt status register
            MIS: mmio.Mmio(packed struct(u32) {
                ///  Receive overrun masked interrupt status
                RORMIS: u1,
                ///  Receive timeout masked interrupt status
                RTMIS: u1,
                ///  Receive FIFO masked interrupt status
                RXMIS: u1,
                ///  Transmit FIFO masked interrupt status
                TXMIS: u1,
                padding: u28,
            }),
            ///  Interrupt clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  Receive overrun interrupt clear
                RORIC: u1,
                ///  Receive timeout interrupt clear
                RTIC: u1,
                padding: u30,
            }),
            ///  DMA control register
            DMACR: mmio.Mmio(packed struct(u32) {
                ///  Receive DMA Enable
                TXDMAE: u1,
                ///  Transmit DMA Enable
                RXDMAE: u1,
                padding: u30,
            }),
        };

        pub const CRG = extern struct {
            ///  Oscillator power down register
            OSC_PDR: mmio.Mmio(packed struct(u32) {
                ///  Internal 8MHz RC oscillator power down flag
                OSCPD: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Normal = 0x0,
                        PowerDown = 0x1,
                    },
                },
                padding: u31,
            }),
            reserved16: [12]u8,
            ///  PLL power down register
            PLL_PDR: mmio.Mmio(packed struct(u32) {
                ///  PLL power down flag
                PLLPD: packed union {
                    raw: u1,
                    value: enum(u1) {
                        PowerDown = 0x0,
                        Normal = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  PLL frequency calculating register
            PLL_FCR: mmio.Mmio(packed struct(u32) {
                ///  Output divider control bits
                OD: u2,
                reserved8: u6,
                ///  Pre divider control bits
                N: u6,
                reserved16: u2,
                ///  Loop divider control bits
                M: u6,
                padding: u10,
            }),
            ///  PLL output enable register
            PLL_OER: mmio.Mmio(packed struct(u32) {
                ///  PLL output flag
                PLLOEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  VCO is working but FOUT is low only
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  PLL bypass register
            PLL_BPR: mmio.Mmio(packed struct(u32) {
                ///  PLL bypass flag
                PLLBP: u1,
                padding: u31,
            }),
            ///  PLL input frequency select register
            PLL_IFSR: mmio.Mmio(packed struct(u32) {
                ///  PLL input clock source select flag
                PLLIS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x0,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x1,
                    },
                },
                padding: u31,
            }),
            reserved48: [12]u8,
            ///  FCLK source select register
            FCLK_SSR: mmio.Mmio(packed struct(u32) {
                padding: u32,
            }),
            ///  FCLK prescale value select register
            FCLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  FCLK prescale value select bits
                FCKPRE: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                    },
                },
                padding: u30,
            }),
            reserved64: [8]u8,
            ///  SSPCLK source select register
            SSPCLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  SSPCLK source select bits
                SSPCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  SSPCLK prescale value select register
            SSPCLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  SSPCLK prescale value select bits
                SSPCP: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                    },
                },
                padding: u30,
            }),
            reserved96: [24]u8,
            ///  ADCCLK source select register
            ADCCLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  ADCCLK source select bits
                ADCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  ADCCLK prescale value select register
            ADCCLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  ADCCLK prescale value select bits
                ADCCP: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                    },
                },
                padding: u30,
            }),
            reserved112: [8]u8,
            ///  TIMER0CLK source select register
            TIMER0CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  TIMERnCLK source select bits
                TCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  TIMER0CLK prescale value select register
            TIMER0CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  TIMERnCLK prescale value select bits
                TCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved128: [8]u8,
            ///  TIMER1CLK source select register
            TIMER1CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  TIMERnCLK source select bits
                TCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  TIMER1CLK prescale value select register
            TIMER1CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  TIMERnCLK prescale value select bits
                TCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved176: [40]u8,
            ///  PWM0CLK source select register
            PWM0CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM0CLK prescale value select register
            PWM0CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved192: [8]u8,
            ///  PWM1CLK source select register
            PWM1CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM1CLK prescale value select register
            PWM1CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved208: [8]u8,
            ///  PWM2CLK source select register
            PWM2CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM2CLK prescale value select register
            PWM2CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved224: [8]u8,
            ///  PWM3CLK source select register
            PWM3CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM3CLK prescale value select register
            PWM3CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved240: [8]u8,
            ///  PWM4CLK source select register
            PWM4CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM4CLK prescale value select register
            PWM4CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved256: [8]u8,
            ///  PWM5CLK source select register
            PWM5CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM5CLK prescale value select register
            PWM5CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved272: [8]u8,
            ///  PWM6CLK source select register
            PWM6CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM6CLK prescale value select register
            PWM6CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved288: [8]u8,
            ///  PWM7CLK source select register
            PWM7CLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK source select bits
                PCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM7CLK prescale value select register
            PWM7CLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  PWMnCLK prescale value select bits
                PCPS: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved304: [8]u8,
            ///  RTCCLK source select register
            RTC_HS_SSR: mmio.Mmio(packed struct(u32) {
                ///  RTC High Speed source select bits
                RTCHS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  RTCCLK prescale value select register
            RTC_HS_PVSR: mmio.Mmio(packed struct(u32) {
                ///  RTC High Speed prescale value select bits
                RTCPRE: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved316: [4]u8,
            ///  RTCCLK 32K select register
            RTC_SSR: mmio.Mmio(packed struct(u32) {
                ///  RTC source select bits
                RTCSEL: packed union {
                    raw: u1,
                    value: enum(u1) {
                        RTCCLK_hs = 0x0,
                        ///  Low speed external oscillator clock
                        @"32K_OSC_CLK" = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  WDOGCLK High Speed source select register
            WDOGCLK_HS_SSR: mmio.Mmio(packed struct(u32) {
                ///  WDOGCLK High Speed source select bits
                WDHS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  WDOGCLK High Speed prescale value select register
            WDOGCLK_HS_PVSR: mmio.Mmio(packed struct(u32) {
                ///  WDOGCLK High Speed prescale value select bits
                WDPRE: packed union {
                    raw: u3,
                    value: enum(u3) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                        ///  1/16
                        By16 = 0x4,
                        ///  1/32
                        By32 = 0x5,
                        ///  1/64
                        By64 = 0x6,
                        ///  1/128
                        By128 = 0x7,
                    },
                },
                padding: u29,
            }),
            reserved336: [8]u8,
            ///  UARTCLK source select register
            UARTCLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  UARTCLK source select bits
                UCSS: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Disable = 0x0,
                        ///  Output clock of PLL (MCLK)
                        PLL = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  UARTCLK prescale value select register
            UARTCLK_PVSR: mmio.Mmio(packed struct(u32) {
                ///  UARTCLK prescale value select bits
                UCP: packed union {
                    raw: u2,
                    value: enum(u2) {
                        ///  1/1
                        Bypass = 0x0,
                        ///  1/2
                        Half = 0x1,
                        ///  1/4
                        By4 = 0x2,
                        ///  1/8
                        By8 = 0x3,
                    },
                },
                padding: u30,
            }),
            reserved352: [8]u8,
            ///  MII clock enable control register
            MIICLK_ECR: mmio.Mmio(packed struct(u32) {
                ///  MII RX Clock source enable register flag
                EN_MIIREN: u1,
                ///  MII TX Clock source enable flag
                EN_MIITEN: u1,
                padding: u30,
            }),
            reserved368: [12]u8,
            ///  Select clock source for monitoring (monitoring pin : PA_02)
            MONCLK_SSR: mmio.Mmio(packed struct(u32) {
                ///  Monitoring Clock source select bits
                CLKMON_SEL: packed union {
                    raw: u5,
                    value: enum(u5) {
                        ///  MCLK
                        PLL = 0x0,
                        FCLK = 0x1,
                        ///  Internal 8MHz RC oscillator clock (RCLK)
                        Internal = 0x2,
                        ///  External oscillator clock (OCLK, 8MHz-24MHz)
                        External = 0x3,
                        ADCCLK = 0x4,
                        SSPCLK = 0x5,
                        TIMCLK0 = 0x6,
                        TIMCLK1 = 0x7,
                        PWMCLK0 = 0x8,
                        PWMCLK1 = 0x9,
                        PWMCLK2 = 0xa,
                        PWMCLK3 = 0xb,
                        PWMCLK4 = 0xc,
                        PWMCLK5 = 0xd,
                        PWMCLK6 = 0xe,
                        PWMCLK7 = 0xf,
                        UARTCLK = 0x10,
                        MII_RCK = 0x11,
                        MII_TCK = 0x12,
                        RTCCLK = 0x13,
                        _,
                    },
                },
                padding: u27,
            }),
        };

        pub const UART0 = extern struct {
            ///  Data
            DR: mmio.Mmio(packed struct(u32) {
                ///  DATA[7:0] bits (Receive (READ)/Transmit (WRITE) data)
                DATA: u8,
                ///  Framing Error
                FE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the received character didn’t have a valid stop bit
                        Error = 0x1,
                        _,
                    },
                },
                ///  Parity Error
                PE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the line control register, UARTLCR_H select
                        Error = 0x1,
                        _,
                    },
                },
                ///  Break Error
                BE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the received data input was held LOW of longer than a full word transmission time(defined as start, data, parity and stop bits)
                        Error = 0x1,
                        _,
                    },
                },
                ///  Overrun Error
                OE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        FIFOFull = 0x1,
                        _,
                    },
                },
                padding: u20,
            }),
            ///  Receive Status
            RSR: mmio.Mmio(packed struct(u32) {
                ///  Framing Error
                FE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the received character didn’t have a valid stop bit
                        Error = 0x1,
                        _,
                    },
                },
                ///  Parity Error
                PE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the parity of the received data character does not match the parity that the EPS and SPS bits in the line control register, UARTLCR_H select
                        Error = 0x1,
                        _,
                    },
                },
                ///  Break Error
                BE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  indicates that the received data input was held LOW of longer than a full word transmission time(defined as start, data, parity and stop bits)
                        Error = 0x1,
                        _,
                    },
                },
                ///  Overrun Error
                OE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        FIFOFull = 0x1,
                        _,
                    },
                },
                padding: u28,
            }),
            reserved32: [24]u8,
            ///  IrDA Low-power Counter
            ILPR: mmio.Mmio(packed struct(u32) {
                ///  low-power divisor value
                ILPDVSR: u8,
                padding: u24,
            }),
            ///  Integer Baud Rate
            IBRD: u32,
            ///  Fractional Baud Rate
            FBRD: u32,
            ///  Line Control
            LCR_H: mmio.Mmio(packed struct(u32) {
                ///  Send break
                BRK: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Parity enable
                PEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Even parity select
                EPS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Odd = 0x0,
                        Even = 0x1,
                    },
                },
                reserved4: u1,
                ///  Enable FIFOs
                FEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Word length
                WLEN: packed union {
                    raw: u2,
                    value: enum(u2) {
                        @"5Bits" = 0x0,
                        @"6Bits" = 0x1,
                        @"7Bits" = 0x2,
                        @"8Bits" = 0x3,
                    },
                },
                ///  Stick parity select
                SPS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u24,
            }),
            ///  Control
            CR: mmio.Mmio(packed struct(u32) {
                ///  UART enable
                UARTEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  SIR enable
                SIREN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  IrDA SIR low power mode
                SIRLP: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  low level bits are transmitted as an active high pulse with a width of 3/16th of the bit period.
                        Disable = 0x0,
                        ///  low level bits are transmitted with a pulse width that is 3 times the period of the IrLPBaud16 input signal, regardless of the selected bit rate.
                        Enable = 0x1,
                    },
                },
                reserved8: u5,
                ///  Transmit enable
                TXE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Receive enable
                RXE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Data transmit ready
                DTR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        High = 0x0,
                        Low = 0x1,
                    },
                },
                ///  Request to send
                RTS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        High = 0x0,
                        Low = 0x1,
                    },
                },
                ///  Complement of Out1 modem status output
                Out1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        High = 0x0,
                        Low = 0x1,
                    },
                },
                ///  Complement of Out2 modem status output
                Out2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        High = 0x0,
                        Low = 0x1,
                    },
                },
                ///  RTS hardware flow control enable
                RTSEn: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  CTS hardware flow control enable
                CTSEn: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u16,
            }),
            ///  Interrupt FIFO Level Select
            IFLS: mmio.Mmio(packed struct(u32) {
                ///  Transmit interrupt FIFO level select
                TXIFLSEL: packed union {
                    raw: u3,
                    value: enum(u3) {
                        Full1_8 = 0x0,
                        Full1_4 = 0x1,
                        Full1_2 = 0x2,
                        Full3_4 = 0x3,
                        Full7_8 = 0x4,
                        _,
                    },
                },
                ///  Receive interrupt FIFO level select
                RXIFLSEL: packed union {
                    raw: u3,
                    value: enum(u3) {
                        Full1_8 = 0x0,
                        Full1_4 = 0x1,
                        Full1_2 = 0x2,
                        Full3_4 = 0x3,
                        Full7_8 = 0x4,
                        _,
                    },
                },
                padding: u26,
            }),
            ///  Interrupt Mask Set / Clear
            IMSC: mmio.Mmio(packed struct(u32) {
                ///  nUARTRI modem interrupt mask
                RIMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  nUARTCTS modem interrupt mask
                CTSMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  nUARTDCD modem interrupt mask
                DCDMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  nUARTDSR modem interrupt mask
                DSRMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Receive interrupt mask
                RXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Transmit interrupt mask
                TXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Receive interrupt mask
                RTIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Framing error interrupt mask
                FEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Parity error interrupt mask
                PEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Break error interrupt mask
                BEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Overrun error interrupt mask
                OEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u21,
            }),
            ///  Raw Interrupt Status
            RIS: mmio.Mmio(packed struct(u32) {
                ///  nUARTRI modem interrupt status
                RIMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTCTS modem interrupt status
                CTSMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTDCD modem interrupt status
                DCDMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTDSR modem interrupt status
                DSRMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Receive interrupt status
                RXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Transmit interrupt status
                TXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Receive interrupt status
                RTIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Framing error interrupt status
                FEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Parity error interrupt status
                PEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Break error interrupt status
                BEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Overrun error interrupt status
                OEIM: u1,
                padding: u21,
            }),
            ///  Masked Interrupt Status
            MIS: mmio.Mmio(packed struct(u32) {
                ///  nUARTRI modem masked interrupt status
                RIMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTCTS modem masked interrupt status
                CTSMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTDCD modem masked interrupt status
                DCDMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  nUARTDSR modem masked interrupt status
                DSRMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Receive masked interrupt status
                RXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Transmit masked interrupt status
                TXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Receive masked interrupt status
                RTIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Framing error masked interrupt status
                FEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Parity error masked interrupt status
                PEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Break error masked interrupt status
                BEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                ///  Overrun error masked interrupt status
                OEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Set = 0x1,
                        _,
                    },
                },
                padding: u21,
            }),
            ///  Interrupt Clear
            ICR: mmio.Mmio(packed struct(u32) {
                ///  nUARTRI modem interrupt clear
                RIMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  nUARTCTS modem interrupt clear
                CTSMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  nUARTDCD modem interrupt clear
                DCDMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  nUARTDSR modem interrupt clear
                DSRMIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Receive interrupt clear
                RXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Transmit interrupt clear
                TXIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Receive interrupt clear
                RTIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Framing error interrupt clear
                FEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Parity error interrupt clear
                PEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Break error interrupt clear
                BEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Overrun error interrupt clear
                OEIM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                padding: u21,
            }),
            ///  DMA Control
            DMACR: mmio.Mmio(packed struct(u32) {
                ///  Receive DMA enable
                RXDMAE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Transmit DMA enable
                TXDMAE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  DMA on error
                DMAONERR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u29,
            }),
        };

        pub const PWM = extern struct {
            ///  Interrupt enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  Channel 0
                IE0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 1
                IE1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 2
                IE2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 3
                IE3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 4
                IE4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 5
                IE5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 6
                IE6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  Channel 7
                IE7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u24,
            }),
            ///  Start Stop register
            SSR: mmio.Mmio(packed struct(u32) {
                ///  Channel 0
                SS0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 1
                SS1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 2
                SS2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 3
                SS3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 4
                SS4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 5
                SS5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 6
                SS6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                ///  Channel 7
                SS7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Start = 0x1,
                    },
                },
                padding: u24,
            }),
            ///  Pause register
            PSR: mmio.Mmio(packed struct(u32) {
                ///  Channel 0
                PS0: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 1
                PS1: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 2
                PS2: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 3
                PS3: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 4
                PS4: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 5
                PS5: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 6
                PS6: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                ///  Channel 7
                PS7: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotPaused = 0x0,
                        Paused = 0x1,
                    },
                },
                padding: u24,
            }),
        };

        pub const PWM0 = extern struct {
            ///  Interrupt register
            IR: mmio.Mmio(packed struct(u32) {
                ///  Match Interrupt occurs
                MI: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotOccured = 0x0,
                        Occured = 0x1,
                    },
                },
                ///  Overflow Interrupt occurs
                OI: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotOccured = 0x0,
                        Occured = 0x1,
                    },
                },
                ///  Capture Interrupt occurs
                CI: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotOccured = 0x0,
                        Occured = 0x1,
                    },
                },
                padding: u29,
            }),
            ///  Interrupt enable register
            IER: mmio.Mmio(packed struct(u32) {
                ///  Match Interrupt Enable
                MIE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotEnabled = 0x0,
                        Enabled = 0x1,
                    },
                },
                ///  Overflow Interrupt Enable
                OIE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotEnabled = 0x0,
                        Enabled = 0x1,
                    },
                },
                ///  Capture Interrupt Enable
                CIE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        NotEnabled = 0x0,
                        Enabled = 0x1,
                    },
                },
                padding: u29,
            }),
            ///  Interrupt clear register
            ICR: mmio.Mmio(packed struct(u32) {
                ///  Match Interrupt is cleared
                MIC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Overflow Interrupt is cleared
                OIC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  Capture Interrupt is cleared
                CIC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                padding: u29,
            }),
            ///  Timer/Counter register
            TCR: mmio.Mmio(packed struct(u32) {
                ///  Timer/Counter
                TCR: u32,
            }),
            ///  Prescale counter register
            PCR: mmio.Mmio(packed struct(u32) {
                ///  Prescale Counter
                PCR: u6,
                padding: u26,
            }),
            ///  Prescale register
            PR: mmio.Mmio(packed struct(u32) {
                ///  Prescale
                PR: u6,
                padding: u26,
            }),
            ///  Match register
            MR: mmio.Mmio(packed struct(u32) {
                ///  Match
                MR: u32,
            }),
            ///  Limit register
            LR: mmio.Mmio(packed struct(u32) {
                ///  Limit
                LR: u32,
            }),
            ///  Up-Down mode register
            UDMR: mmio.Mmio(packed struct(u32) {
                ///  Up-Down mode
                UDM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Up = 0x0,
                        Down = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  Timer/Counter mode register
            TCMR: mmio.Mmio(packed struct(u32) {
                ///  TCM[1:0] bits (Timer/Counter mode)
                TCM: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Timer = 0x0,
                        CounterRising = 0x1,
                        CounterFalling = 0x2,
                        CounterToggle = 0x3,
                    },
                },
                padding: u30,
            }),
            ///  PWM output enable and external input enable register
            PEEER: mmio.Mmio(packed struct(u32) {
                ///  PWM output Enable and External input Enable
                PEEE: packed union {
                    raw: u2,
                    value: enum(u2) {
                        OutDisableInDisable = 0x0,
                        OutDisableInEnable = 0x1,
                        OutEnableInDisable = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            ///  Capture mode register
            CMR: mmio.Mmio(packed struct(u32) {
                ///  Capture mode
                CM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        RisingEdge = 0x0,
                        FallingEdge = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  Capture register
            CR: mmio.Mmio(packed struct(u32) {
                ///  Capture
                CR: u32,
            }),
            ///  Periodic mode register
            PDMR: mmio.Mmio(packed struct(u32) {
                ///  Periodic Mode
                PDM: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Periodic = 0x0,
                        OneShot = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  Dead-zone enable register
            DZER: mmio.Mmio(packed struct(u32) {
                ///  Dead Zone Enable
                DZE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  Dead-zone counter register
            DZCR: mmio.Mmio(packed struct(u32) {
                ///  Dead Zone Counter value
                DZC: u10,
                padding: u22,
            }),
        };

        pub const PAD_A = extern struct {
            ///  PAD Control register
            PCR: [16]mmio.Mmio(packed struct(u32) {
                ///  Pull-up, Pull-down selection register
                PUPD: packed union {
                    raw: u2,
                    value: enum(u2) {
                        Neither = 0x0,
                        PullDown = 0x1,
                        PullUp = 0x2,
                        _,
                    },
                },
                ///  Driving strength selection register
                DS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        High = 0x0,
                        Low = 0x1,
                    },
                },
                ///  Open Drain output mode register
                OD: u1,
                reserved5: u1,
                ///  Input buffer enable selection register
                IE: u1,
                ///  CMOS input or Summit trigger input selection register
                CS: packed union {
                    raw: u1,
                    value: enum(u1) {
                        SummitTrigger = 0x0,
                        CMOS = 0x1,
                    },
                },
                padding: u25,
            }),
        };

        pub const AFC = extern struct {
            PA00: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOA_0 = 0x0,
                        PWM6 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA01: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOA_1 = 0x0,
                        PWM7 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA02: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOA_2 = 0x0,
                        CLKOUT = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA03: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SWCLK = 0x0,
                        PWM0 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA04: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SWDIO = 0x0,
                        PWM1 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA05: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SSEL0 = 0x0,
                        SCL1 = 0x2,
                        PWM2 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA06: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SCLK0 = 0x0,
                        SDA1 = 0x2,
                        PWM3 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA07: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        MISO0 = 0x0,
                        U_CTS1 = 0x2,
                        PWM4 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA08: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        MOSI0 = 0x0,
                        U_RTS1 = 0x2,
                        PWM5 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA09: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SCL0 = 0x0,
                        U_TXD1 = 0x2,
                        PWM6 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA10: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SDA0 = 0x0,
                        U_RXD1 = 0x2,
                        PWM7 = 0x3,
                        _,
                    },
                },
                padding: u30,
            }),
            PA11: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_CTS0 = 0x0,
                        SSEL1 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA12: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_RTS0 = 0x0,
                        SCLK1 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA13: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_TXD0 = 0x0,
                        MISO1 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA14: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_RXD0 = 0x0,
                        MOSI1 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PA15: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOA_15 = 0x0,
                        _,
                    },
                },
                padding: u30,
            }),
            PB00: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SSEL1 = 0x0,
                        GPIOB_0 = 0x1,
                        U_CTS0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PB01: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SCLK1 = 0x0,
                        GPIOB_1 = 0x1,
                        U_RTS0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PB02: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        MISO1 = 0x0,
                        GPIOB_2 = 0x1,
                        U_TXD0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PB03: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        MOSI1 = 0x0,
                        GPIOB_3 = 0x1,
                        U_RXD0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PB04: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXEN = 0x0,
                        GPIOB_4 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB05: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        COL = 0x0,
                        GPIOB_5 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB06: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXD3 = 0x0,
                        GPIOB_6 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB07: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXCLK = 0x0,
                        GPIOB_7 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB08: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        DUP = 0x0,
                        GPIOB_8 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB09: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXCLK = 0x0,
                        GPIOB_9 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB10: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXD0 = 0x0,
                        GPIOB_10 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB11: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXD1 = 0x0,
                        GPIOB_11 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB12: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXD2 = 0x0,
                        GPIOB_12 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB13: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        TXD3 = 0x0,
                        GPIOB_13 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PB14: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOB_14 = 0x0,
                        _,
                    },
                },
                padding: u30,
            }),
            PB15: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOB_15 = 0x0,
                        _,
                    },
                },
                padding: u30,
            }),
            PC00: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_CTS1 = 0x0,
                        GPIOC_0 = 0x1,
                        PWM0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC01: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_RTS1 = 0x0,
                        GPIOC_1 = 0x1,
                        PWM1 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC02: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_TXD1 = 0x0,
                        GPIOC_2 = 0x1,
                        PWM2 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC03: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_RXD1 = 0x0,
                        GPIOC_3 = 0x1,
                        PWM3 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC04: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SCL1 = 0x0,
                        GPIOC_4 = 0x1,
                        PWM4 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC05: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        SDA1 = 0x0,
                        GPIOC_5 = 0x1,
                        PWM5 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC06: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOC_6 = 0x0,
                        U_TXD2 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC07: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        GPIOC_7 = 0x0,
                        U_RXD2 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC08: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        PWM0 = 0x0,
                        GPIOC_8 = 0x1,
                        SCL0 = 0x2,
                        AIN7 = 0x3,
                    },
                },
                padding: u30,
            }),
            PC09: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        PWM1 = 0x0,
                        GPIOC_9 = 0x1,
                        SDA0 = 0x2,
                        AIN6 = 0x3,
                    },
                },
                padding: u30,
            }),
            PC10: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_TXD2 = 0x0,
                        GPIOC_10 = 0x1,
                        PWM2 = 0x2,
                        AIN5 = 0x3,
                    },
                },
                padding: u30,
            }),
            PC11: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        U_RXD2 = 0x0,
                        GPIOC_11 = 0x1,
                        PWM3 = 0x2,
                        AIN4 = 0x3,
                    },
                },
                padding: u30,
            }),
            PC12: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        AIN3 = 0x0,
                        GPIOC_12 = 0x1,
                        SSEL0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC13: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        AIN2 = 0x0,
                        GPIOC_13 = 0x1,
                        SCLK0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC14: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        AIN1 = 0x0,
                        GPIOC_14 = 0x1,
                        MISO0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PC15: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        AIN0 = 0x0,
                        GPIOC_15 = 0x1,
                        MOSI0 = 0x2,
                        _,
                    },
                },
                padding: u30,
            }),
            PD00: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        CRS = 0x0,
                        GPIOD_0 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PD01: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXDV = 0x0,
                        GPIOD_1 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PD02: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXD0 = 0x0,
                        GPIOD_2 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PD03: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXD1 = 0x0,
                        GPIOD_3 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            PD04: mmio.Mmio(packed struct(u32) {
                AF: packed union {
                    raw: u2,
                    value: enum(u2) {
                        RXD2 = 0x0,
                        GPIOD_4 = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
        };

        pub const ADC = extern struct {
            ///  ADC control register
            CTR: mmio.Mmio(packed struct(u32) {
                ///  Sampling mode
                SMPSEL: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Abnormal = 0x0,
                        Normal = 0x1,
                    },
                },
                ///  power down flag
                PWD: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Active = 0x0,
                        PowerDown = 0x1,
                    },
                },
                padding: u30,
            }),
            ///  ADC channel select register
            CHSEL: mmio.Mmio(packed struct(u32) {
                ///  ADC Channel Select bits
                CHSEL: packed union {
                    raw: u4,
                    value: enum(u4) {
                        Channel0 = 0x0,
                        Channel1 = 0x1,
                        Channel2 = 0x2,
                        Channel3 = 0x3,
                        Channel4 = 0x4,
                        Channel5 = 0x5,
                        Channel6 = 0x6,
                        Channel7 = 0x7,
                        NoChannel = 0x8,
                        LDOOutput1V5 = 0xf,
                        _,
                    },
                },
                padding: u28,
            }),
            ///  ADC start register
            START: mmio.Mmio(packed struct(u32) {
                ///  Start ADC for conversion
                ADC_SRT: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Ready = 0x0,
                        ///  This bit clear automatically after conversion
                        Start = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  ADC conversion data register
            DATA: mmio.Mmio(packed struct(u32) {
                ///  ADC conversion result data
                ADC_DATA: u12,
                padding: u20,
            }),
            ///  ADC interrupt register
            INT: mmio.Mmio(packed struct(u32) {
                ///  ADC conversion is done of Interrupt bit
                INT: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Done = 0x0,
                        NotDone = 0x1,
                    },
                },
                ///  Interrupt mask signal
                MASK: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u30,
            }),
            reserved28: [8]u8,
            ///  ADC interrupt clear register
            INTCLR: mmio.Mmio(packed struct(u32) {
                ///  ADC conversion is done of Interrupt bit
                INTCLR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                padding: u31,
            }),
        };

        pub const RTC = extern struct {
            ///  control register
            RTCCON: mmio.Mmio(packed struct(u32) {
                ///  Clock Enable
                CLKEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Divider Reset
                DIVRST: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Reset = 0x1,
                        _,
                    },
                },
                reserved5: u3,
                ///  RTC Interrupt Enable
                INTEN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u26,
            }),
            ///  Interrupt Mask register
            RTCINTE: mmio.Mmio(packed struct(u32) {
                ///  RTC Second Interrupt Enable
                IMSEC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Minute Interrupt Enable
                IMMIN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Hour Interrupt Enable
                IMHOUR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Date Interrupt Enable
                IMDATE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Day Interrupt Enable
                IMDAY: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Month Interrupt Enable
                IMMON: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                ///  RTC Alarm Interrupt Enable
                AINT: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                padding: u25,
            }),
            ///  Interrupt Pending register
            RTCINTP: mmio.Mmio(packed struct(u32) {
                ///  RTC Counter Interrupt pending flag
                RTCCIF: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm interrupt pending flag
                RTCALF: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Clear = 0x1,
                        _,
                    },
                },
                padding: u30,
            }),
            ///  Alarm Mask register
            RTCAMR: mmio.Mmio(packed struct(u32) {
                ///  RTC Alarm Mask for Second
                AMRSEC: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Minute
                AMRMIN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Hour
                AMRHOUR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Day
                AMRDAY: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Date
                AMRDATE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Month
                AMRMON: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                ///  RTC Alarm Mask for Year
                AMRYEAR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Enable = 0x1,
                        _,
                    },
                },
                padding: u25,
            }),
            ///  BCD Second register
            BCDSEC: mmio.Mmio(packed struct(u32) {
                ///  BCDSEC[6:0] bits (RTC Seconds value (0 to 59))
                BCDSEC: u7,
                padding: u25,
            }),
            ///  BCD Minute register
            BCDMIN: mmio.Mmio(packed struct(u32) {
                ///  BCDMIN[6:0] bits (RTC Minute value (0 to 59))
                BCDMIN: u7,
                padding: u25,
            }),
            ///  BCD Hour register
            BCDHOUR: mmio.Mmio(packed struct(u32) {
                ///  BCDHOUR[5:0] bits (RTC Hour value (0 to 23))
                BCDHOUR: u6,
                padding: u26,
            }),
            ///  BCD Day register
            BCDDAY: mmio.Mmio(packed struct(u32) {
                ///  BCDDAY[3:0] bits (RTC Day of Week value (1 to 7))
                BCDDAY: u4,
                padding: u28,
            }),
            ///  BCD Date register
            BCDDATE: mmio.Mmio(packed struct(u32) {
                ///  BCDDATE[5:0] bits (RTC Day of Month value (1 to 28, 29, 30, or 31))
                BCDDATE: u6,
                padding: u26,
            }),
            ///  BCD Month register
            BCDMON: mmio.Mmio(packed struct(u32) {
                ///  BCDMON[4:0] bits (RTC Month value (1 to 12))
                BCDMON: u5,
                padding: u27,
            }),
            ///  BCD Year register
            BCDYEAR: mmio.Mmio(packed struct(u32) {
                ///  BCDYEAR[15:0] bits (RTC Year value (0 to 4095))
                BCDYEAR: u16,
                padding: u16,
            }),
            ///  Predetermining Second register
            PRESEC: mmio.Mmio(packed struct(u32) {
                ///  PRESEC[6:0] bits (RTC PREDETERMINING Seconds value (0 to 59))
                PRESEC: u7,
                padding: u25,
            }),
            ///  Predetermining Minute register
            PREMIN: mmio.Mmio(packed struct(u32) {
                ///  PREMIN[6:0] bits (RTC Predetermining Minute value (0 to 59))
                PREMIN: u7,
                padding: u25,
            }),
            ///  Predetermining Hour register
            PREHOUR: mmio.Mmio(packed struct(u32) {
                ///  PREHOUR[5:0] bits (RTC Predetermining Hour value (0 to 23))
                PREHOUR: u6,
                padding: u26,
            }),
            ///  Predetermining Day register
            PREDAY: mmio.Mmio(packed struct(u32) {
                ///  PREDAY[3:0] bits (RTC Predetermining Day of Week value (1 to 7))
                PREDAY: u4,
                padding: u28,
            }),
            ///  Predetermining Date register
            PREDATE: mmio.Mmio(packed struct(u32) {
                ///  PREDATE[3:0] bits (RTC Predetermining Day of Month value (1 to 28, 29, 30, or 31))
                PREDATE: u6,
                padding: u26,
            }),
            ///  Predetermining Month register
            PREMON: mmio.Mmio(packed struct(u32) {
                ///  PREMON[3:0] bits (RTC Predetermining Month value (1 to 12))
                PREMON: u5,
                padding: u27,
            }),
            ///  Predetermining Year register
            PREYEAR: mmio.Mmio(packed struct(u32) {
                ///  PREYEAR[15:0] bits (RTC Predetermining Year value (0 to 4095))
                PREYEAR: u16,
                padding: u16,
            }),
            ///  Consolidated Time0 register
            RTCTIME0: mmio.Mmio(packed struct(u32) {
                ///  CBCDSEC[6:0] bits (RTC Consolidated Second value (0 to 59))
                CBCDSEC: u7,
                reserved8: u1,
                ///  CBCDMIN[14:8] bits (RTC Consolidated Minute value (0 to 59))
                CBCDMIN: u7,
                reserved16: u1,
                ///  CBCDHOUR[21:16] bits (RTC Consolidated Hour value (0 to 23))
                CBCDHOUR: u6,
                reserved24: u2,
                ///  CBCDDAY[27:24] bits ( RTC Consolidated Day of Week value (1 to 7))
                CBCDDAY: u4,
                padding: u4,
            }),
            ///  Consolidated Time1 register
            RTCTIME1: mmio.Mmio(packed struct(u32) {
                ///  CBCDDATE[5:0] bits (RTC Consolidated Day of Month value (1 to 28, 29, 30, or 31))
                CBCDDATE: u6,
                reserved8: u2,
                ///  CBCDMON[12:8] bits (RTC Consolidated Month value (1 to 12))
                CBCDMON: u5,
                reserved16: u3,
                ///  CBCDYEAR[31:16] bits (RTC Consolidated Year value (0 to 4095))
                CBCDYEAR: u16,
            }),
        };

        pub const SYSCFG = extern struct {
            ///  Remap Control Register (R/W)
            REMAP: u32,
            ///  PMU Control Register (R/W)
            PMUCTRL: u32,
            ///  Reset Option Register (R/W)
            RESETOP: u32,
            ///  EMI Control Register (R/W)
            EMICTRL: u32,
            ///  Reset Information Register (R/W)
            RSTINFO: mmio.Mmio(packed struct(u32) {
                ///  Reset Request Enable
                SYS: u1,
                ///  Interrupt Enable
                RST: u1,
                padding: u30,
            }),
        };

        pub const GPIOA = extern struct {
            ///  DATA register
            DATA: mmio.Mmio(packed struct(u32) {
                ///  Port input data bit
                DAT0: u1,
                ///  Port input data bit
                DAT1: u1,
                ///  Port input data bit
                DAT2: u1,
                ///  Port input data bit
                DAT3: u1,
                ///  Port input data bit
                DAT4: u1,
                ///  Port input data bit
                DAT5: u1,
                ///  Port input data bit
                DAT6: u1,
                ///  Port input data bit
                DAT7: u1,
                ///  Port input data bit
                DAT8: u1,
                ///  Port input data bit
                DAT9: u1,
                ///  Port input data bit
                DAT10: u1,
                ///  Port input data bit
                DAT11: u1,
                ///  Port input data bit
                DAT12: u1,
                ///  Port input data bit
                DAT13: u1,
                ///  Port input data bit
                DAT14: u1,
                ///  Port input data bit
                DAT15: u1,
                padding: u16,
            }),
            ///  Data Output Latch register
            DATAOUT: mmio.Mmio(packed struct(u32) {
                ///  Port out data bit
                DAO0: u1,
                ///  Port out data bit
                DAO1: u1,
                ///  Port out data bit
                DAO2: u1,
                ///  Port out data bit
                DAO3: u1,
                ///  Port out data bit
                DAO4: u1,
                ///  Port out data bit
                DAO5: u1,
                ///  Port out data bit
                DAO6: u1,
                ///  Port out data bit
                DAO7: u1,
                ///  Port out data bit
                DAO8: u1,
                ///  Port out data bit
                DAO9: u1,
                ///  Port out data bit
                DAO10: u1,
                ///  Port out data bit
                DAO11: u1,
                ///  Port out data bit
                DAO12: u1,
                ///  Port out data bit
                DAO13: u1,
                ///  Port out data bit
                DAO14: u1,
                ///  Port out data bit
                DAO15: u1,
                padding: u16,
            }),
            reserved16: [8]u8,
            ///  Output Enable Set register
            OUTENSET: mmio.Mmio(packed struct(u32) {
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES0: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES1: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES2: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES3: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES4: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES5: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES6: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES7: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES8: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES9: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES10: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES11: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES12: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES13: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES14: u1,
                ///  sets the corresponding output enable bit, indicates the signal direction
                ES15: u1,
                padding: u16,
            }),
            ///  Output Enable Clear register
            OUTENCLR: mmio.Mmio(packed struct(u32) {
                ///  clears the output enable bit, indicates the signal direction
                EC0: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC1: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC2: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC3: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC4: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC5: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC6: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC7: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC8: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC9: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC10: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC11: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC12: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC13: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC14: u1,
                ///  clears the output enable bit, indicates the signal direction
                EC15: u1,
                padding: u16,
            }),
            reserved32: [8]u8,
            ///  Interrupt Enable Set register
            INTENSET: mmio.Mmio(packed struct(u32) {
                ///  sets the interrupt enable bit, indicates the interrupt
                IES0: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES1: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES2: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES3: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES4: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES5: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES6: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES7: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES8: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES9: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES10: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES11: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES12: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES13: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES14: u1,
                ///  sets the interrupt enable bit, indicates the interrupt
                IES15: u1,
                padding: u16,
            }),
            ///  Interrupt Enable Clear register
            INTENCLR: mmio.Mmio(packed struct(u32) {
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC0: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC1: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC2: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC3: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC4: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC5: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC6: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC7: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC8: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC9: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC10: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC11: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC12: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC13: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC14: u1,
                ///  clears the interrupt enable bit, indicates the interrupt
                IEC15: u1,
                padding: u16,
            }),
            ///  Interrupt Type Set register
            INTTYPESET: mmio.Mmio(packed struct(u32) {
                ///  sets the interrupt type bit, indicates for edge or level
                ITS0: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS1: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS2: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS3: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS4: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS5: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS6: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS7: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS8: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS9: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS10: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS11: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS12: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS13: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS14: u1,
                ///  sets the interrupt type bit, indicates for edge or level
                ITS15: u1,
                padding: u16,
            }),
            ///  Interrupt Type Clear register
            INTTYPECLR: mmio.Mmio(packed struct(u32) {
                ///  clears the interrupt type bit, indicates for edge or level
                ITC0: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC1: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC2: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC3: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC4: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC5: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC6: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC7: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC8: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC9: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC10: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC11: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC12: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC13: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC14: u1,
                ///  clears the interrupt type bit, indicates for edge or level
                ITC15: u1,
                padding: u16,
            }),
            ///  Interrupt Polarity Set register
            INTPOLSET: mmio.Mmio(packed struct(u32) {
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS0: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS1: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS2: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS3: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS4: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS5: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS6: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS7: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS8: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS9: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS10: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS11: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS12: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS13: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS14: u1,
                ///  sets the interrupt polarity bit, indicates for edge or level
                IPS15: u1,
                padding: u16,
            }),
            ///  Interrupt Polarity Clear register
            INTPOLCLR: mmio.Mmio(packed struct(u32) {
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC0: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC1: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC2: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC3: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC4: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC5: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC6: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC7: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC8: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC9: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC10: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC11: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC12: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC13: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC14: u1,
                ///  clears the interrupt polarity bit, indicates for edge or level
                IPC15: u1,
                padding: u16,
            }),
            ///  Interrupt Status register
            INTSTATUS: u32,
            reserved1024: [964]u8,
            ///  Lower byte Masked Access register
            LB_MASKED: [256]mmio.Mmio(packed struct(u32) {
                ///  Data for lower byte access
                LBM: u8,
                padding: u24,
            }),
            ///  Upper byte Masked Access register
            UB_MASKED: [256]mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  Data for higher byte access
                HBM: u8,
                padding: u16,
            }),
        };

        pub const DMA = extern struct {
            ///  DMA status register
            STATUS: mmio.Mmio(packed struct(u32) {
                ///  Enable status of the controller
                ENABLE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                reserved4: u3,
                ///  Current state of the control state machine
                STATE: packed union {
                    raw: u4,
                    value: enum(u4) {
                        Idle = 0x0,
                        ReadingChanCtrlData = 0x1,
                        ReadingSrcDataEndPtr = 0x2,
                        ReadingDstDataEndPtr = 0x3,
                        ReadingSrcData = 0x4,
                        WritingDstData = 0x5,
                        WritingChanCtrlData = 0x6,
                        Stalled = 0x8,
                        Done = 0x9,
                        PeriphScatGathTrans = 0xa,
                        _,
                    },
                },
                padding: u24,
            }),
            ///  DMA configuration register
            CFG: mmio.Mmio(packed struct(u32) {
                ///  Enable for the controller
                ENABLE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Disable = 0x0,
                        Enable = 0x1,
                    },
                },
                reserved5: u4,
                ///  Set the AHB-Lite protection
                PROT_CTRL: u3,
                padding: u24,
            }),
            ///  Channel Control Data Base Pointer register
            CTRL_BASE_PTR: mmio.Mmio(packed struct(u32) {
                reserved8: u8,
                ///  Pointer to the base address of the primary data structure
                CTRL_BASE_PTR: u24,
            }),
            ///  Channel Alternate Control Data Base Pointer register
            ALT_CTRL_BASE_PTR: mmio.Mmio(packed struct(u32) {
                ///  Base address of the alternate data structure
                ALT_CTRL_BASE_PTR: u32,
            }),
            ///  Channel Wait On Request Status register
            WAITONREQ_STATUS: mmio.Mmio(packed struct(u32) {
                ///  Channel wait on request status
                DMA_WAITONREQ: u6,
                padding: u26,
            }),
            ///  Channel Software Request register
            CHNL_SW_REQUEST: mmio.Mmio(packed struct(u32) {
                ///  Set the appropriate bit to generate a software DMA request
                CHNL_SW_REQUEST: u6,
                padding: u26,
            }),
            ///  Channel UseBurst Set register
            CHNL_USEBURST_SET: mmio.Mmio(packed struct(u32) {
                ///  CHNL_USEBURST_SET[5:0] bits (Returns the useburst status, or disable dma_sreq[Channel-1] form generating DMA requests)
                CHNL_USEBURST_SET: u6,
                padding: u26,
            }),
            ///  Channel UseBurst Clear register
            CHNL_USEBURST_CLR: mmio.Mmio(packed struct(u32) {
                ///  CHNL_USEBURST_CLR[5:0] bits (Set the appropriate bit to enable dma_sreq[Channel-1] to generate requests)
                CHNL_USEBURST_CLR: u6,
                padding: u26,
            }),
            ///  Channel Request Mask Set register
            CHNL_REQ_MASK_SET: mmio.Mmio(packed struct(u32) {
                ///  CHNL_REQ_MASK_SET[5:0] bits (Returns the request mask status of dma_req[Channel-1] and dma_sreq[Channel-1], or disables the corresponding channel from generating DMA requests)
                CHNL_REQ_MASK_SET: u6,
                padding: u26,
            }),
            ///  Channel Request Mask Clear register
            CHNL_REQ_MASK_CLR: mmio.Mmio(packed struct(u32) {
                ///  CHNL_REQ_MASK_CLR[5:0] bits (Set the appropriate bit to enable DMA requests for the channel corresponding to dma_req[Channel-1] and dma_sreq[Channel-1])
                CHNL_REQ_MASK_CLR: u6,
                padding: u26,
            }),
            ///  Channel Enable Set register
            CHNL_ENABLE_SET: mmio.Mmio(packed struct(u32) {
                ///  CHNL_ENABLE_SET[5:0] bits (Set the appropriate bit to enable DMA requests for the channel corresponding to dma_req[Channel-1] and dma_sreq[Channel-1])
                CHNL_ENABLE_SET: u6,
                padding: u26,
            }),
            ///  Channel Enable Clear register
            CHNL_ENABLE_CLR: mmio.Mmio(packed struct(u32) {
                ///  Set the appropriate bit to disable the corresponding DMA channel
                CHNL_ENABLE_CLR: u6,
                padding: u26,
            }),
            ///  Channel Primary-Alterante Set register
            CHNL_PRI_ALT_SET: mmio.Mmio(packed struct(u32) {
                ///  CHNL_PRI_ALT_SET[5:0] bits (Returns the channel control data structure status, or selects the alternate data structure for the corresponding DMA channels)
                CHNL_PRI_ALT_SET: u6,
                padding: u26,
            }),
            ///  Channel Primary-Alterante Clear register
            CHNL_PRI_ALT_CLR: mmio.Mmio(packed struct(u32) {
                ///  Set the appropriate bit to select the primary data structure for the corresponding DMA channel
                CHNL_PRI_ALT_CLR: u6,
                padding: u26,
            }),
            ///  Channel Priority Set register
            CHNL_PRIORITY_SET: mmio.Mmio(packed struct(u32) {
                ///  CHNL_PRIORITY_SET[5:0] bits (Returns the channel priority mask status, or set the channel priority to high)
                CHNL_PRIORITY_SET: u6,
                padding: u26,
            }),
            ///  Channel Priority Clear register
            CHNL_PRIORITY_CLR: mmio.Mmio(packed struct(u32) {
                ///  Set the appropriate bit to select the default priority level for the specified DMA channel
                CHNL_PRIORITY_CLR: u6,
                padding: u26,
            }),
            reserved76: [12]u8,
            ///  Bus Error Clear register
            ERR_CLR: mmio.Mmio(packed struct(u32) {
                ///  Returns the status of DMA_ERR, or set the signal LOW
                ERR_CLR: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Low = 0x0,
                        High = 0x1,
                    },
                },
                padding: u31,
            }),
        };

        pub const UART2 = extern struct {
            ///  Data register
            DR: mmio.Mmio(packed struct(u32) {
                ///  Receive (READ)/Transmit (WRITE) data
                DATA: u8,
                padding: u24,
            }),
            ///  Status register
            SR: mmio.Mmio(packed struct(u32) {
                ///  TX buffer full, read only
                TXBF: u1,
                ///  RX buffer full, read only
                RXBF: u1,
                ///  TX buffer overrun, wirte 1 to clear
                TXO: u1,
                ///  RX buffer overrun, wirte 1 to clear
                RXO: u1,
                padding: u28,
            }),
            ///  Control register
            CR: mmio.Mmio(packed struct(u32) {
                ///  TX enable
                TXE: u1,
                ///  RX enable
                RXE: u1,
                ///  TX interrupt enable
                TXIE: u1,
                ///  RX interrupt enable
                RXIE: u1,
                ///  TX overrun interrupt enable
                TOIE: u1,
                ///  RX overrun interrupt enable
                ROIE: u1,
                padding: u26,
            }),
            ///  Interrupt Status register
            ISR: mmio.Mmio(packed struct(u32) {
                ///  Transmit Interrupt
                TXI: u1,
                ///  Receive Interrupt
                RXI: u1,
                ///  Transmit Overrun Interrupt
                TXOI: u1,
                ///  Receive Overrun Interrupt
                RXOI: u1,
                padding: u28,
            }),
            ///  Baudrate Divider register
            BDR: mmio.Mmio(packed struct(u32) {
                ///  Baud rate divider
                BAUDDIV: u20,
                padding: u12,
            }),
        };

        pub const RNG = extern struct {
            ///  RNG run register
            RUN: mmio.Mmio(packed struct(u32) {
                ///  RUN RNG shift flag
                RUN: packed union {
                    raw: u1,
                    value: enum(u1) {
                        Stop = 0x0,
                        Run = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  RNG seed value register
            SEED: mmio.Mmio(packed struct(u32) {
                ///  seed value of random number generator shift register
                SEED: u32,
            }),
            ///  RNG Clock source select register
            CLKSEL: mmio.Mmio(packed struct(u32) {
                ///  select clock source register of RNG shift register
                CLKSEL: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  refer to clock generator block
                        RNG = 0x0,
                        PCLK = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  RNG MODE select register
            MODE: mmio.Mmio(packed struct(u32) {
                ///  RNG run mode select register
                MODE: packed union {
                    raw: u1,
                    value: enum(u1) {
                        ///  which is for power on random number
                        PLL_LOCK = 0x0,
                        RNG_RUN = 0x1,
                    },
                },
                padding: u31,
            }),
            ///  RNG random number value register
            RN: mmio.Mmio(packed struct(u32) {
                ///  random number of RNG shift register
                RN: u32,
            }),
            ///  RNG polynomial register
            POLY: mmio.Mmio(packed struct(u32) {
                ///  32bit polynomial of random number generator
                POLY: u32,
            }),
        };
    };
};
