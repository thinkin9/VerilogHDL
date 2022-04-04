module priority_encoder (
    a,
    y
);

input       [3:0] a;
output reg  [3:0] y;

always @(a) begin
    casex(a)
        4'b1xxx: y=4'b1000;
        4'b01xx: y=4'b0100;
        4'b001x: y=4'b0010;
        4'b0001: y=4'b0001;
        default: y=4'b0000;
    endcase
end

endmodule