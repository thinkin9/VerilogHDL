module enabled_flipflop (
    d, en, clk,
    q
);

input       d, en, clk;
output reg  q;

always @(posedge clk) begin
    if(en) q <= d;
    else;
end
    
endmodule