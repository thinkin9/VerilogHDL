module sec_fsm (
    clk, reset, start, stop,
    en
);

input       clk;
input       reset;
input       start;
input       stop;
output reg  [1:0]   en;

reg     [1:0]   state;
reg     [1:0]   next_state;

parameter T0=2'b00;
parameter T1=2'b01;
parameter T2=2'b10;

always @(posedge clk or posedge reset) begin
    if(reset) state<=T0;
    else state<=next_state;
end

always @(state or start or stop) begin
    if(stop) next_state=T0;
    else begin
        case(state) begin
            T0:     if(start)   next_state=T1;
                    else        next_state=T0;
            T1:     if(start)   next_state=T2;
                    else        next_state=T1;
            T2:     if(start)   next_state=T1;
                    else        next_state=T2;
            defalut:            next_state=T0;
        endcase
    end
end

always @(state) begin
    case(state) begin
        T1: en=T1;
        T2: en=T2;
        defalut: en=T0;
    endcase
end

endmodule