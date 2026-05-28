module tb_moore_overlapping;
    reg clk,reset,x;
    wire y;
    moore_overlapping dut(clk, reset, x, y);
    always#5 clk = ~clk;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_moore_overlapping);
        clk = 0;
        reset = 1;
        x = 0;
        #10 reset = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #50 $finish;
    end
endmodule
