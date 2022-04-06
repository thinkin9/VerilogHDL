module segment_decoder(
    d,
    seg
);

input       [3:0] d;
output      [7:0] seg;

// seg[0] = B'D' + AD' + A'BD + BCD + AB'C'
// seg[1] = A'B' + B'D' + A'C'D' + A'CD + AC'D
// seg[2] = A'C' + A'D + C'D + A'B + AB'
// seg[3] = AC' + A'B'D' + B'CD + BC'D + BCD'
// seg[4] = B'D' + CD' + AC + AB
// seg[5] = C'D' + A'B + BC + AB'
// seg[6] = B'C + CD' + AB' + AD + A'BC'
// seg[7] = AC + AB
assign seg[0]=
