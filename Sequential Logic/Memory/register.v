module register (
    d, clk, reset
    q
);

input       clk;
input       reset;
input       [7:0]d;
output reg  [7:0]q;

always @(posedge clk or posedge reset) begin
    if(reset) q <= 8'b0000_0000;
    else q <= d;
end

endmodule