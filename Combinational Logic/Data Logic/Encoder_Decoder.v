module encoder (
    y0, y1, y2, y3,
    a, b
);

input y0, y1, y2, y3;
output a, b;

assign a= ~y0 & ~y1;
assign b= ~y0 & ~y2;
    
endmodule

module decoder1 (
    a, b,
    y0, y1, y2, y3
);

input a, b;
output y0, y1, y2, y3;

assign y0= ~a & ~b;
assign y1= ~a & b;
assign y2= a & ~b;
assign y3= a & b;
    
endmodule

module decoder2 (
    a, b,
    y0, y1, y2, y3
);

input a, b;
output reg y0, y1, y2, y3;

always @(a, b) begin
    case({a, b})
        2'b00: {y0, y1, y2, y3}=4'b1000;
        2'b01: {y0, y1, y2, y3}=4'b0100;
        2'b10: {y0, y1, y2, y3}=4'b0010;
        2'b11: {y0, y1, y2, y3}=4'b0001;
    endcase
end
    
endmodule