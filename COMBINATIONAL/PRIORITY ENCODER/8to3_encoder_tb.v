module tb_priority_encoder8to3;
reg [7:0] y;
wire [2:0] a;
wire valid;
priority_encoder8to3 uut(.y(y),.a(a),.valid(valid));
initial begin
    $dumpfile("priority_encoder8to3.vcd");
    $dumpvars(0, tb_priority_encoder8to3);
end
initial begin
    $monitor("Time=%0t y=%b a=%b valid=%b", $time, y, a, valid);
    y = 8'b00000000; #10;
    y = 8'b00000001; #10;
    y = 8'b00000010; #10;
    y = 8'b00000100; #10;
    y = 8'b00001000; #10;
    y = 8'b00010000; #10;
    y = 8'b01000000; #10;
    y = 8'b10000000; #10;
    y = 8'b11111111; #10;
    $finish;
end
endmodule
