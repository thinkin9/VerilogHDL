module tristate_buffer (
    a, en,
    y
);

input       a, en;
output      y;

assign y= en ? a : 1'bz;
    
endmodule

module tristate_buffer_for_BUS (
    a, en,
    y
);

input       [7:0]a, en;
output      [7:0]y;

assign y= en ? a : 7'bz;
    
endmodule