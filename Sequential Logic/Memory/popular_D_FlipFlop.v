module popular_d_flipflop (
    clk, reset, en, d,
    q
);

input       clk;
input       reset;
input       en;
input       [3:0]d;
output reg  [3:0]q;

// Asynchronous reset and enable
always @(posedge clk or posedge reset) begin
    if(reset) begin
        q <= 4'b0;
    end
    else begin
        if(en) q <= d;
    end
end

endmodule