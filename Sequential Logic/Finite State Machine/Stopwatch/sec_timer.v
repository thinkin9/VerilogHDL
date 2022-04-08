module sec_timer (
    clk, reset, sec_count, stop,
    a, b, c, d, e, f, g
);

input       clk;
input       reset;
input       [18:0] sec_count;
input       stop;

output reg  [3:0] a;
output reg  [3:0] b;
output reg  [3:0] c;
output reg  [3:0] d;
output reg  [3:0] e;
output reg  [3:0] f;
output reg  [3:0] g;

// 0.01 s
always @(posedge clk or posedge reset) begin
    if(reset)   a<=4'd0;
    else begin
        if((a==4'b1010||stop)) a<=4'd0;
        else begin
            if(sec_count==19'd499_999) a<=a+4'd1;
            else;
        end
    end
end

// 0.1s
always @(posedge clk or posedge reset) begin
    if(reset) b<=4'd0;
    else begin
        if((b==4'b1010||stop)) b<=4'd0;
        else begin
            if(a==4'b1010) b<=b+4'd1;
            else;
        end
    end
end

// 1s
always @(posedge clk or posedge reset) begin
    if(reset) c<=4'd0;
    else begin
        if((c==4'b1010||stop)) c<=4'd0;
        else begin
            if(b==4'b1010) c<=c+4'd1;
            else;
        end
    end
end

// 10s
always @(posedge clk or posedge reset) begin
    if(reset) c<=4'd0;
    else begin
        if((d==4'b0110||stop)) d<=4'd0;
        else begin
            if(c==4'b1010) d<=4'd1;
            else;
        end
    end
end

// 1m
always @(posedge clk or posedge reset) begin
    if(reset) e<=4'd0;
    else begin
        if((e==4'b1010||stop)) e<=4'd0;
        else begin
            if(d==4'b0110) e<=4'd1;
            else;
        end
    end
end

// 10m
always @(posedge clk or posedge reset) begin
    if(reset) f<=4'd0;
    else begin
        if((f==4'b0110||stop)) f<=4'd0;
        else begin
            if(e==4'b1010) f<=4'd1;
            else
        end
    end
end

endmodule