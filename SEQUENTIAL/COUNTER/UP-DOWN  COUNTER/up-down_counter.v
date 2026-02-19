module tb_sync_down_counter;
reg clk;
reg rst;
wire [3:0] q;
sync_down_counter uut(.clk(clk),.rst(rst),.q(q));
always #5 clk = ~clk;
initial begin
    $dumpfile("sync_down_counter.vcd");
    $dumpvars(0, tb_sync_down_counter);
    $monitor("Time=%0t clk=%b rst=%b q=%b", $time, clk, rst, q);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #100 $finish;
end
endmodule
