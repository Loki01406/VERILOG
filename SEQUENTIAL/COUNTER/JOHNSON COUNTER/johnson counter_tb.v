module johnson_counter_tb;
reg clk;
reg rst;
wire [3:0] q;
johnson_counter uut (.clk(clk),.rst(rst),.q(q));
always #5 clk = ~clk;
initial
begin
    $dumpfile("johnson.vcd");
    $dumpvars(0, johnson_counter_tb);
    $monitor("Time = %0t | Reset = %b | Output = %b", $time, rst, q);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #100 $finish;
end
endmodule
