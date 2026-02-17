module sr_ff_tb;
reg S,R;
wire Q,Qbar;
sr_ff uut(S,R,Q,Qbar);
initial begin
$monitor("Time=%0t S=%b R=%b Q=%b Qbar=%b",$time,S,R,Q,Qbar);
$dumpfile("sr_ff.vcd");
$dumpvars(0,sr_ff_tb);
S=0;R=0;
#10 S=1;R=0;
#10 S=0;R=1;
#10 S=0;R=0;
#10 S=1;R=1;
#10 $finish;
end
endmodule
