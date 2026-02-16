module register_tb;
reg clk,reset;
reg [3:0] d;
wire [3:0] q;
register uut(clk,reset,d,q);
initial begin
$dumpfile("register.vcd");
$dumpvars(0,register_tb);
$monitor("Time=%0t clk=%b reset=%b d=%b q=%b",$time,clk,reset,d,q);
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=1; d=4'b0000;
#10 reset=0; d=4'b1010;
#10 d=4'b1100;
#10 d=4'b1111;
#10 reset=1;
#10 $finish;
end
endmodule
