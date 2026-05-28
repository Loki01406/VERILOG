module moore_overlapping(
    input clk,
    input reset,
    input x,
    output reg y
);
    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
    reg[2:0] state,next_state;
    always@(posedge clk or posedge reset) begin
        if(reset)
            state <= S0;
        else
            state <= next_state;
    end
    always@(*) begin
        case(state)
            S0:next_state = x?S1:S0;
            S1:next_state = x?S2:S0;
            S2:next_state = x?S2:S3;
            S3:next_state = x?S4:S0;
            S4:next_state = x?S2:S0;
            default:next_state = S0;
        endcase
    end
    always@(*) begin
        y = (state == S4);
    end
endmodule
