module SR_Latch1 (
    reset, set,
    result
);

input       reset, set;
output reg  result;

always @(reset, set) begin
    casex({reset, set})
        2'b01: result=1'b1;
        2'b10: result=1'b0;
        2'b11: result=1'bx;
        2'b00: result=result; // Possible? or Omit
    endcase
end
    
endmodule