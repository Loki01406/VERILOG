//TWO BIT COMPARATOR
module comparator_2bit (
    input A1, A0,
    input B1, B0,
    output EQ,
    output GT,
    output LT
);
wire x1, x0;
wire nx1, nx0;
wire nA1, nA0, nB1, nB0;
wire gt1, gt2;
wire lt1, lt2;
xor (x1, A1, B1);
xor (x0, A0, B0);
not (nx1, x1);
not (nx0, x0);
and (EQ, nx1, nx0);
not (nA1, A1);
not (nA0, A0);
not (nB1, B1);
not (nB0, B0);
and (gt1, A1, nB1);
and (gt2, nx1, A0,nB0);
or  (GT, gt1, gt2);
and (lt1, nA1, B1);
and (lt2, nx1, nA0, B0);
or  (LT, lt1, lt2);
endmodule

//TESTBENCH
module tb_comparator_2bit;
reg A1, A0;
reg B1, B0;
wire EQ, GT, LT;
comparator_2bit uut (.A1(A1),.A0(A0),.B1(B1),.B0(B0),.EQ(EQ),.GT(GT),.LT(LT));
initial begin
    $dumpfile("comp2bit.vcd");
    $dumpvars(0, tb_comparator_2bit);
    $monitor("Time=%0t A=%b%b B=%b%b EQ=%b GT=%b LT=%b", $time, A1, A0, B1, B0, EQ, GT, LT);
    A1=0; A0=0; B1=0; B0=0; #10;
    A1=0; A0=1; B1=0; B0=0; #10;
    A1=1; A0=0; B1=0; B0=1; #10;
    A1=1; A0=1; B1=1; B0=1; #10;
    A1=0; A0=0; B1=1; B0=1; #10;
    $finish;
end
endmodule

//output//
Time=0 A=00 B=00 EQ=1 GT=0 LT=0
Time=10 A=01 B=00 EQ=0 GT=1 LT=0
Time=20 A=10 B=01 EQ=0 GT=1 LT=0
Time=30 A=11 B=11 EQ=1 GT=0 LT=0
Time=40 A=00 B=11 EQ=0 GT=0 LT=1 
