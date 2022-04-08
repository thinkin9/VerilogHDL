module stopwatch_top(
    clk, reset, start, stop,
    a, b, c, d, e, f, g
);

input           clk;
input           reset;
input           start;
input           stop;

output          [3:0] a;
output          [3:0] b;
output          [3:0] c;
output          [3:0] d;
output          [3:0] e;
output          [3:0] f;

wire [18:0] sec_count;
wire [1:0] en;

sec_counter sec_counter(
    .clk(clk),
    .reset(reset),
    .en(en),
    .sec_count(sec_count)
);

sec_fsm sec_fsm(
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .en(en)
);

sec_timer sec_timer(
    .clk(clk),
    .reset(reset),
    .sec_count(sec_count),
    .stop(stop),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .e(e),
    .f(f)
);

endmodule