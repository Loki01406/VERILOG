module jk_latch_tb;
reg j,k,en;
wire q,qbar;
jk_latch uut(j,k,en,q,qbar);
initial begin
$dumpfile("jk_latch.vcd");
$dumpvars(0,jk_latch_tb);
$monitor("Time=%0t j=%b k=%b en=%b q=%b qbar=%b",$time,j,k,en,q,qbar);
j=0; k=0; en=0;
#10 en=1; j=1; k=0;
#10 j=0; k=1;
#10 j=1; k=1;
#10 j=0; k=0;
#10 $finish;
end
endmodule
