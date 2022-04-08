module fsm (
    clk, reset, count,
    d, seg_sel
);

input       clk;
input       reset;
input       [9:0] count;
output reg  [3:0] d;
output reg  [5:0] seg_sel;

reg [2:0] state, next_state;
parameter S0=3'b000;
parameter S1=3'b001;
parameter S2=3'b010;
parameter S3=3'b011;
parameter S4=3'b100;
parameter S5=3'b101;

// status register
always @(posedge clk or posedge reset) begin
    if(reset) state <= S0;
    else state <= next_state;
end

// next state logic
always @(state or count) begin
    if(count == 10'h3FF) begin
        case(state) begin
            S0: next_state=S1;
            S1: next_state=S2;
            S2: next_state=S3;
            S3: next_state=S4;
            S4: next_state=S5;
            S5: next_state=S0;
        endcase
    end
    else next_state = state;
end

always @(state) begin
    case(state) begin
        S0: begin seg_sel=6'h20; d=4'h0; end;
        S1: begin seg_sel=6'h10; d=4'h1; end;
        S2: begin seg_sel=6'h08; d=4'h2; end;
        S3: begin seg_sel=6'h04; d=4'h3; end;
        S4: begin seg_sel=6'h02; d=4'h4; end;
        S5: begin seg_sel=6'h01; d=4'h5; end;
    endcase
end    
endmodule