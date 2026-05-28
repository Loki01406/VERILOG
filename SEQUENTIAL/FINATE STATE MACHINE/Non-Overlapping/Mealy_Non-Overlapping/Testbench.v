module tb_mealy_nonoverlapping;
    reg clk,reset,x;
    wire y;
    mealy_nonoverlapping dut(clk,reset,x,y);
    always#5 clk = ~clk;
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_mealy_nonoverlapping);
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
