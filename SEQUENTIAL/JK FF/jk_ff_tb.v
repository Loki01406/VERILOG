module tb_jk_flipflop;
reg clk;
reg rst;
reg j;
reg k;
wire q;
jk_flipflop uut(.clk(clk),.rst(rst),.j(j),.k(k),.q(q));
always #5 clk=~clk;
initial begin
$dumpfile("jk_flipflop.vcd");
$dumpvars(0,tb_jk_flipflop);
$monitor("Time=%0t rst=%b j=%b k=%b q=%b",$time,rst,j,k,q);
clk=0;
rst=1;
j=0;
k=0;
#10 rst=0;
#10 j=1;k=0;
#10 j=0;k=1;
#10 j=1;k=1;
#30 j=0;k=0;
#20 $finish;
end
endmodule
