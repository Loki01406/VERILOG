module t_latch_tb;
reg t,en;
wire q,qbar;
t_latch uut(t,en,q,qbar);
initial begin
$dumpfile("t_latch.vcd");
$dumpvars(0,t_latch_tb);
$monitor("Time=%0t t=%b en=%b q=%b qbar=%b",$time,t,en,q,qbar);
t=0; en=0;
#10 en=1; t=1;
#10 t=0;
#10 t=1;
#10 en=0;
#10 $finish;
end
endmodule
