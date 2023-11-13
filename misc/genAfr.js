const reg = [
    ["PA00", "GPIOA_0",    null,           "PWM6",     null],
    ["PA01", "GPIOA_1",    null,           "PWM7",     null],
    ["PA02", "GPIOA_2",    null,           "CLKOUT",   null],
    ["PA03", "SWCLK",      null,           null,       "PWM0"],
    ["PA04", "SWDIO",      null,           null,       "PWM1"],
    ["PA05", "SSEL0",      null,           "SCL1",     "PWM2"],
    ["PA06", "SCLK0",      null,           "SDA1",     "PWM3"],
    ["PA07", "MISO0",      null,           "U_CTS1",   "PWM4"],
    ["PA08", "MOSI0",      null,           "U_RTS1",   "PWM5"],
    ["PA09", "SCL0",       null,           "U_TXD1",   "PWM6"],
    ["PA10", "SDA0",       null,           "U_RXD1",   "PWM7"],
    ["PA11", "U_CTS0",     null,           "SSEL1",    null],
    ["PA12", "U_RTS0",     null,           "SCLK1",    null],
    ["PA13", "U_TXD0",     null,           "MISO1",    null],
    ["PA14", "U_RXD0",     null,           "MOSI1",    null],
    ["PA15", "GPIOA_15",   null,           null,       null],
    ["PB00", "SSEL1",      "GPIOB_0",      "U_CTS0",   null],
    ["PB01", "SCLK1",      "GPIOB_1",      "U_RTS0",   null],
    ["PB02", "MISO1",      "GPIOB_2",      "U_TXD0",   null],
    ["PB03", "MOSI1",      "GPIOB_3",      "U_RXD0",   null],
    ["PB04", "TXEN",       "GPIOB_4",      null,       null],
    ["PB05", "COL",        "GPIOB_5",      null,       null],
    ["PB06", "RXD3",       "GPIOB_6",      null,       null],
    ["PB07", "RXCLK",      "GPIOB_7",      null,       null],
    ["PB08", "DUP",        "GPIOB_8",      null,       null],
    ["PB09", "TXCLK",      "GPIOB_9",      null,       null],
    ["PB10", "TXD0",       "GPIOB_10",     null,       null],
    ["PB11", "TXD1",       "GPIOB_11",     null,       null],
    ["PB12", "TXD2",       "GPIOB_12",     null,       null],
    ["PB13", "TXD3",       "GPIOB_13",     null,       null],
    ["PB14", "GPIOB_14",   null,           null,       null],
    ["PB15", "GPIOB_15",   null,           null,       null],
    ["PC00", "U_CTS1",     "GPIOC_0",      "PWM0",     null],
    ["PC01", "U_RTS1",     "GPIOC_1",      "PWM1",     null],
    ["PC02", "U_TXD1",     "GPIOC_2",      "PWM2",     null],
    ["PC03", "U_RXD1",     "GPIOC_3",      "PWM3",     null],
    ["PC04", "SCL1",       "GPIOC_4",      "PWM4",     null],
    ["PC05", "SDA1",       "GPIOC_5",      "PWM5",     null],
    ["PC06", "GPIOC_6",    null,           "U_TXD2",   null],
    ["PC07", "GPIOC_7",    null,           "U_RXD2",   null],
    ["PC08", "PWM0",       "GPIOC_8",      "SCL0",     "AIN7"],
    ["PC09", "PWM1",       "GPIOC_9",      "SDA0",     "AIN6"],
    ["PC10", "U_TXD2",     "GPIOC_10",     "PWM2",     "AIN5"],
    ["PC11", "U_RXD2",     "GPIOC_11",     "PWM3",     "AIN4"],
    ["PC12", "AIN3",       "GPIOC_12",     "SSEL0",     null],
    ["PC13", "AIN2",       "GPIOC_13",     "SCLK0",     null],
    ["PC14", "AIN1",       "GPIOC_14",     "MISO0",     null],
    ["PC15", "AIN0",       "GPIOC_15",     "MOSI0",     null],
    ["PD00", "CRS",        "GPIOD_0",      null,        null],
    ["PD01", "RXDV",       "GPIOD_1",      null,        null],
    ["PD02", "RXD0",       "GPIOD_2",      null,        null],
    ["PD03", "RXD1",       "GPIOD_3",      null,        null],
    ["PD04", "RXD2",       "GPIOD_4",      null,        null],
];

let off = 0;
for(let [port, ...a] of reg) {
    let en = "";
    for(let i of [0, 1, 2, 3]) {
        if(a[i]) en += `
        <enumeratedValue>
          <name>${a[i]}</name>
          <value>0b${i.toString(2)}</value>
        </enumeratedValue>`;
    }
console.log(`<register>
  <name>${port}</name>
  <addressOffset>0x${off.toString(16).toUpperCase()}</addressOffset>
  <fields>
    <field>
      <name>AF</name>
      <bitRange>[1:0]</bitRange>
      <enumeratedValues>${en}
      </enumeratedValues>
    </field>
  </fields>
</register>`);
off += 4;
}
