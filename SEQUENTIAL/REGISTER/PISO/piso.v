module piso(clk,reset,load,d,so);
input clk,reset,load;
input[3:0]d;
output so;
reg[3:0]q;
always@(posedge clk or posedge reset)
begin
if(reset)
q<=4'b0000;
else if(load)
q<=d;
else
q<={q[2:0],1'b0};
end
assign so=q[3];
endmodule
