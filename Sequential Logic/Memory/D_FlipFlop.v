module d_flipflop1 (
    d, clk,
    q
);

input       d, clk;
output reg  q;

always @(posedge clk) begin
    q <= d;
end

endmodule

module d_flipflop2 (
    d, clk,
    q
);

input       d, clk;
output reg  q;

always @(negedge clk) begin
    q <= d;
end

endmodule