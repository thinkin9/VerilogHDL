module multiplexer1 (
    a,b,sel,
    y
);

input       a, b, sel;
output      y;

assign y= sel ? a : b;
    
endmodule

module multiplexer2 (
    a,b,sel,
    y
);

input       a, b, sel;
output      y;

assign y= (a&sel) | (b&~sel);
    
endmodule

module multiplexer3 (
    a,b,sel,
    y
);

input       a, b, sel;
output reg  y;

always @(a, b, sel) begin
    if(sel) y=a;
    else y=b;
end
    
endmodule