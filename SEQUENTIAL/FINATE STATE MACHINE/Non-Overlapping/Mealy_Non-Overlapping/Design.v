module mealy_nonoverlapping(
    input clk,
    input reset,
    input x,
    output reg y
);
    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;
    reg [1:0] state,next_state;
    always@(posedge clk or posedge reset) begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end
    always@(*) begin
        next_state = state;
        y = 0;
        case(state)
            S0:begin
                if(x)
                    next_state = S1;
                else
                    next_state = S0;
            end
            S1:begin
                if(x)
                    next_state = S2;
                else
                    next_state = S0;
            end
            S2:begin
                if(x)
                    next_state = S2;
                else
                    next_state = S3;
            end
            S3:begin
                if(x) begin
                    next_state = S0;
                    y = 1;
                end
                else
                    next_state = S0;
            end
        endcase
    end
endmodule
