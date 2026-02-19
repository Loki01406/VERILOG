module tb_counter_4bit_sync;
reg clk;
reg rst;
wire [3:0] q;
counter_4bit_sync uut(.clk(clk),.rst(rst), .q(q));
always #5 clk = ~clk;
initial
begin
    $dumpfile("counter_4bit_sync.vcd");
    $dumpvars(0, tb_counter_4bit_sync);
    $monitor("Time=%0t clk=%b rst=%b q=%b", $time, clk, rst, q);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #160 $finish;
end
endmodule
