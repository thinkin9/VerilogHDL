module sync_blocking(
    clk, d,
    q    
);

input       clk, d;
output reg  q;
reg         n1;

always @(posedge clk) begin
    n1 = d;
    q = n1;
end

endmodule

module sync_nonblocking(
    clk, d,
    q
);

input       clk, d;
output reg  q;
reg         n1;

always @(posedge clk) begin
    n1 <= d;
    q <= n1;
end

endmodule
