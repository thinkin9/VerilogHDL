module sec_counter (
    clk, reset, en,
    sec_count
);

input       clk;
input       reset;
input       [1:0] en;
output reg  [18:0] sec_count;

always @(posedge clk or posedge reset or en) begin
    if(reset) sec_count<=19'b0;
    else begin
        case(en) begin
            2'b00: sec_count<=0;
            2'b01: sec_count<=sec_count+1'b1;
            2'b10: sec_count<=sec_count+1'b1;
            default: sec_count<=0;
        endcase
    end
end
    
endmodule