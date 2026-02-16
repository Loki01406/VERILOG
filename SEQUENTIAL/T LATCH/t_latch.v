module t_latch(t,en,q,qbar);
input t,en;
output reg q;
output qbar;
assign qbar = ~q;

always @(t or en)
begin
if(en)
begin
if(t==0)
q=q;
else
q=~q;
end
end
endmodule
