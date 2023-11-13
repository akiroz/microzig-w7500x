let a = 0;
for(let p of ["A", "B", "C", "D"]) {
    for(let i = 0; i < 16; i++) {
        if(p == "A" && i == 0) continue;
        a += 4;
        console.log(`<register derivedFrom="PCR_PA00">
  <name>PCR_P${p}${i}</name>
  <description>PAD Control register</description>
  <addressOffset>0x${a.toString(16).toUpperCase()}</addressOffset>
</register>`);
    }
}
