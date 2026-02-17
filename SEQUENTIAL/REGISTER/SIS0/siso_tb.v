module siso_tb;
reg clk,reset,si;
wire so;
siso uut(clk,reset,si,so);
initial
begin
$dumpfile("siso.vcd");
$dumpvars(0,siso_tb);
$monitor("time=%0t clk=%b reset=%b si=%b so=%b",$time,clk,reset,si,so);
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
