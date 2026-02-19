module tb_up_down_counter;
reg clk;
reg rst;
reg mode;
wire [3:0] q;
up_down_counter uut(.clk(clk),.rst(rst),.mode(mode),.q(q));
always #5 clk = ~clk;
initial begin
    $dumpfile("up_down_counter.vcd");
    $dumpvars(0, tb_up_down_counter);
    $monitor("Time=%0t clk=%b rst=%b mode=%b q=%b", $time, clk, rst, mode, q);
    clk = 0;
    rst = 1;
    mode = 1;
    #10 rst = 0;
    #50 mode = 0;
    #100 $finish;
end
endmodule
