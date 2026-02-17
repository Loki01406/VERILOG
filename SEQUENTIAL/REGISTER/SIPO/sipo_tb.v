module sipo_tb;
reg clk,reset,si;
wire[3:0]q;
sipo uut(clk,reset,si,q);
initial
begin
$dumpfile("sipo.vcd");
$dumpvars(0,sipo_tb);
$monitor("time=%0t clk=%b reset=%b si=%b q=%b",$time,clk,reset,si,q);
clk=0;
reset=1;
si=0;
#5 reset=0;
#10 si=1;
#10 si=0;
#10 si=1;
#10 si=1;
#20 $finish;
end
always #5 clk=~clk;
endmodule
