module sipo(clk,reset,si,q);
input clk,reset,si;
output[3:0]q;
reg[3:0]q;
always@(posedge clk or posedge reset)
begin
if(reset)
q<=4'b0000;
else
q<={q[2:0],si};
end
endmodule
