module pipo_tb;
reg clk,reset;
reg[3:0]d;
wire[3:0]q;
pipo uut(clk,reset,d,q);
initial begin
$dumpfile("pipo.vcd");
$dumpvars(0,pipo_tb);
$monitor("time=%0t clk=%b reset=%b d=%b q=%b",$time,clk,reset,d,q);
clk=0;
reset=1;
d=4'b1101;
#5 reset=0;
#20 d=4'b1010;
#20 $finish;
end
always #5 clk=~clk;
endmodule
