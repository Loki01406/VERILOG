module bidirectional (
    input clk,
    input rst,
    input dir,
    input din,
    output reg [3:0] q
);

always @(posedge clk or posedge rst)
begin
    if (rst)
        q <= 4'b0000;
    else
    begin
        if (dir == 1'b0)
            q <= {q[2:0], din};      
        else
            q <= {din, q[3:1]};     
    end
end

endmodule
