module jk_latch(j,k,en,q,qbar);
input j,k,en;
output reg q;
output qbar;
assign qbar = ~q;

always @(j or k or en)
begin
if(en)
begin
if(j==0 && k==0)
q=q;
else if(j==0 && k==1)
q=0;
else if(j==1 && k==0)
q=1;
else
q=~q;
end
end
endmodule

