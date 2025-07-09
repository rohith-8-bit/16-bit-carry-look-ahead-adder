module alutest;
reg[15:0]X,Y;
wire[15:0]Z;
wire S, ZR, CY, P, V;

adder DUT(X, Y, Z, S, ZR, CY, P, V);

initial 
begin
$dumpfile("adder.vcd");
$dumpvars(0,alutest);
$monitor($time,"X=%h, Y=%h, Z=%h, S=%b, ZR=%b, CY=%b, P=%b, V=%b",X,Y,Z,S,ZR,CY,P,V);
#5 X = 16'h8fff; Y = 16'h8000;
#5 X = 16'hfffe; Y = 16'h0002;
#5 X = 16'haaaa; Y = 16'h5555;
#5 $finish;
end
endmodule 
