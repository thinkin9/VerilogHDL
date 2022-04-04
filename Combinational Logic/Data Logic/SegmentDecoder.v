module segment_decoder (
    value,
    digit
);

input       [3:0]value;
output reg  [6:0]digit;

always @(value) begin
    case(value)
        0: digit=7'b111_1110;
        1: digit=7'b011_0000;
        2: digit=7'b110_1101;
        3: digit=7'b111_1001;
        4: digit=7'b011_0011;
        5: digit=7'b101_1011;
        6: digit=7'b101_1111;
        7: digit=7'b111_0000;
        8: digit=7'b111_1111;
        9: digit=7'b111_1011;
        default: digit=7'b111_1110;
    endcase
end
    
endmodule