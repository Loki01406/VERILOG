module sr_latch_tb;
reg s,r;
wire q,qbar;
sr_latch uut(s,r,q,qbar);
initial begin
$dumpfile("sr_latch.vcd");
$dumpvars(0,sr_latch_tb);
$monitor("Time=%0t s=%b r=%b q=%b qbar=%b",$time,s,r,q,qbar);
s=0; r=0;
#10 s=1; r=0;
#10 s=0; r=1;
#10 s=1; r=1;
#10 s=0; r=0;
#10 $finish;
end
endmodule
