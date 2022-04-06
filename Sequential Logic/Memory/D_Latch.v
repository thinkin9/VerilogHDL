module d_latch (
    d, clk,
    q
);
input       d, clk;
output reg  q;

always @(d, clk) begin
    if(clk) q = d;  // we didn't define the output when the "clk" equals to 0, then the logic will be have a latch
end
endmodule