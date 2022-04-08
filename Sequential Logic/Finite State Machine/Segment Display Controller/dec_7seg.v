module segment_decoder(
    d,
    seg
);

input       [3:0] d;
output      [7:0] seg;

// seg[0] = B'D' + A'C + BC + AD' + A'BD + AB'C'
// seg[1] = A'B' + B'D' + A'C'D' + A'CD + AC'D
// seg[2] = A'C' + A'D + C'D + A'B + AB'
// seg[3] = AC' + A'B'D' + B'CD + BC'D + BCD'
// seg[4] = B'D' + CD' + AC + AB
// seg[5] = C'D' + A'B + BC + AB'
// seg[6] = B'C + CD' + AB' + AD + A'BC'
// seg[7] = AC + AB
assign seg[0] = ~d[2]&~d[0] | ~d[3]&d[1] | d[2]&d[1] | d[3]&~d[0] | ~d[3]&d[2]&d[0] | d[3]&~d[2]&~d[1];
assign seg[1] = ~d[3]&~d[2] | ~d[2]&~d[0] | ~d[3]&~d[1]&~d[0] | ~d[3]&d[1]&d[0] | d[3]&~d[1]&d[0];
assign seg[2] = ~d[3]&~d[1] | ~d[3]&d[0] | ~d[1]&d[0] | ~d[3]&d[2] | d[3]&~d[2];
assign seg[3] = d[3]&~d[1] | ~d[3]&~d[2]&~d[0] | ~d[2]&d[1]&d[0] | d[2]&~d[1]&d[0] | d[2]&d[1]&~d[0];
assign seg[4] = ~d[2]&~d[0] | d[1]&~d[0] | d[3]&d[1] | d[3]&d[2];
assign seg[5] = ~d[1]&~d[0] | ~d[3]&d[2] | d[2]&d[1] | d[3]&~d[2];
assign seg[6] = ~d[2]&d[1] | d[1]&~d[0] | d[3]&~d[2] | d[3]&d[0] | ~d[3]&d[2]&~d[1];
assign seg[7] = d[3]&d[1] | d[3]&d[2];

endmodule