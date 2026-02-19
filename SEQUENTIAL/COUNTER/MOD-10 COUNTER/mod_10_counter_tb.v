module tb_mod10_counter;
reg clk;
reg rst;
wire [3:0] q;
mod10_counter uut(.clk(clk),.rst(rst),.q(q));
always #5 clk = ~clk;
initial begin
    $dumpfile("mod10_counter.vcd");
    $dumpvars(0, tb_mod10_counter)
    $monitor("Time=%0t clk=%b rst=%b q=%d", $time, clk, rst, q)
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #150 $finish;
end
endmodule
