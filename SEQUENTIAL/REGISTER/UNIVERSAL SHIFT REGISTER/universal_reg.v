module universal_shift (
    input clk,
    input rst,
    input S1,
    input S0,
    input din,
    input [3:0] pdata,
    output reg [3:0] q
);
always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 4'b0000;
    else
    begin
        case ({S1,S0})
            2'b00: q <= q;                       
            2'b01: q <= {din, q[3:1]};           
            2'b10: q <= {q[2:0], din};           
            2'b11: q <= pdata;                   
        endcase
    end
end
endmodule
