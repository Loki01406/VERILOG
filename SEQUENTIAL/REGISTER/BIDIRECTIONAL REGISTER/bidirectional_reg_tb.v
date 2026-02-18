`timescale 1ns/1ps

module tb_bidirectional;

reg clk;
reg rst;
reg dir;
reg din;
wire [3:0] q;

bidirectional uut (
    .clk(clk),
    .rst(rst),
    .dir(dir),
    .din(din),
    .q(q)
);

always #5 clk = ~clk;

initial
begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_bidirectional);

    $monitor("Time=%0t | rst=%b dir=%b din=%b q=%b",
              $time, rst, dir, din, q);

    clk = 0;
    rst = 1;
    dir = 0;
    din = 0;

    #10 rst = 0;

    dir = 0; din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    din = 1; #10;

    dir = 1; din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;

    #20 $finish;
end

endmodule
