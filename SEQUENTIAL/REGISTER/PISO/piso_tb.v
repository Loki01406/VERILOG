module piso_tb;
reg clk,reset,load;
reg[3:0]d;
wire so;
piso uut(clk,reset,load,d,so);
initial
begin
$dumpfile("piso.vcd");
$dumpvars(0,piso_tb);
$monitor("time=%0t clk=%b reset=%b load=%b d=%b so=%b",$time,clk,reset,load,d,so);
clk=0;
reset=1;
load=0;
d=4'b1011;
#5 reset=0;
#10 load=1;
#10 load=0;
#50 $finish;
end
always #5 clk=~clk;
endmodule
