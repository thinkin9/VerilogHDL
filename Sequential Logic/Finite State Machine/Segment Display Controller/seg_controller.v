module seg_controller (
    clk, reset,
    seg, seg_sel
);

input       clk;
input       reset;
output reg  [7:0] seg;
output reg  [5:0] seg_sel;

wire        [9:0] count;
wire        [3:0] d;
counter U1_counter(
    .clk(clk),
    .reset(reset),
    .count(count)
);

//    clk, reset, count,
//    d, seg_sel

fsm U0_fsm(
    .clk(clk),
    .reset(reset),
    .count(count),
    .d(d),
    .seg_sel(seg_sel)
);

//    d,
//    seg
deg_7seg U2_dec_7seg(
    .d(d),
    .seg(seg)
);

endmodule