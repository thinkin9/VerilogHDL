/*
FSM Components

1. Status Register (클럭과 리셋을 포함하는 D-FF, initial value + next_state)
2. Next State Logic (next_state의 logic)
3. Output Logic (output의 logic)

*/


module two_bit_counter1(
    clk, reset,
    count
);

input       clk, reset;
output      [1:0] count;

reg         [1:0] state, next_state;

parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;

// 1. Status Register
always @(posedge clk or posedge reset) begin
    if(reset) state <= S0;
    else state <= next_state;
end

// 2. Next State Logic
always @(state) begin
    case(state) begin
        2'b00: next_state = S1;
        2'b01: next_state = S2;
        2'b10: next_state = S3;
        2'b11: next_state = S0;
    endcase
end

// 3. Output Logic
assign count = state;

endmodule

module two_bit_counter1_self(
    clk, reset,
    count  // !
);

input       clk, reset;
output      [1:0] count;
reg         [1:0] state, next_state

parameter S0=2'b00;
parameter S1=2'b01;
parameter S2=2'b10;
parameter S3=2'b11;

always @(posedge clk or posedge reset) begin
    if(reset) state <= S0;
    else state <= next_state;
end

always @(state) begin
    case(state) begin
        2'b00: next_state = S1;
        2'b01: next_state = S2;
        2'b01: next_state = S3;
        2'b11: next_state = S0;
    endcase
end

assign count = state;

endmodule

module two_bit_counter2(
    clk, reset,
    count
);

input       clk, reset;
output reg  [1:0] count;

always @(posedge clk or posedge reset) begin
    if(reset) count <= 2'b00;
    else count <= count + 1'b1;
end
endmodule