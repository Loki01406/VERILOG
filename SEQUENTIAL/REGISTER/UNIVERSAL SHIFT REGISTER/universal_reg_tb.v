module tb_universal_shift;
reg clk,rst;
reg S1, S0;
reg din;
reg [3:0] pdata;
wire [3:0] q;
universal_shift uut ( .clk(clk),.rst(rst),.S1(S1),.S0(S0),.din(din),.pdata(pdata),.q(q));
always #5 clk = ~clk;
initial
begin
    $dumpfile("universal.vcd");
    $dumpvars(0, tb_universal_shift);
    $monitor("Time=%0t | S1=%b S0=%b | din=%b | pdata=%b | q=%b",
              $time, S1, S0, din, pdata, q);
    clk = 0;
    rst = 1;
    S1 = 0;
    S0 = 0;
    din = 0;
    pdata = 4'b0000;
    #10 rst = 0;
    S1=1; S0=1; pdata=4'b1010; #10;
    S1=0; S0=1; din=1; #10;
    din=0; #10;
    S1=1; S0=0; din=1; #10;
    din=1; #10;
    S1=0; S0=0; #10;
    #20 $finish;
end
endmodule
