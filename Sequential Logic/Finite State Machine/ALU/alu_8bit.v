module alu_8bit (
    ia, ib, func,
    oa
);
  
input     [7:0] ia;
input     [7:0] ib;
input     [3:0] func;
output reg [7:0] oa;

always @(ia, ib, func) begin
    case(~func) begin 
        4'b0000: 
            oa= ia & ib;
        4'b0001: 
            oa= ia | ib;
        4'b0010:
            if(ia + ib >= 9'b1_0000_0000)
                oa= 8'hEE;
            else
                oa= ia + ib;
        4'b0011:
            if(ia < ib)
                oa= 8'hEE;
            else
                oa= ia - ib;
        4'b0100:
            oa= ia << ib;
        4'b0101:
            oa= ia >> ib;
        4'b0110:
            oa= ia >>> ib;
        4'b0111:
            oa= ia ^ ib;
        4'b1000:
            if(ia - ib == 0)
                oa= 8'h01;
            else
                oa= 8'h00;
        4'b1001:
            if(ia - ib >= 0)
                oa= 8'h01;
            else
                oa= 8'h00;
        4'b1010:
            if(ia - ib < 0)
                oa= 8'h01;
            else
                oa= 8'h00;
        4'b1011:
            oa= ia + ib << 1;
        4'b1100:
            oa= ia + 4'h4;
        4'b1101:
            oa= ia - 4'h4;
        4'b1110:
            if(ia - ib > 0)
                oa= ia;
            else
                oa= 8'h00;
        4'b1111:
            if(ia - ib < 0)
                oa= ia;
            else   
                oa= 8'h00;
        default: oa= 8'h00;
    endcase
end
endmodule
