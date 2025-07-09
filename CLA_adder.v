module adder(X,Y,Z,sign,zero,carry,parity,overflow);
input [15:0]X,Y;
output [15:0]Z;
output sign, carry, zero, parity, overflow;
wire c[3:1];

assign sign = Z[15];
assign zero = ~|Z;
assign parity = ~^Z;
assign overflow = (X[15]&Y[15]&~Z[15])|(~X[15]&~Y[15]&Z[15]);

adder4 A0 (Z[3:0],c[1],X[3:0],Y[3:0],1'b0);
adder4 A1 (Z[7:4],c[2],X[7:4],Y[7:4],c[1]);
adder4 A2 (Z[11:8],c[3],X[11:8],Y[11:8],c[2]);
adder4 A3 (Z[15:12],carry,X[15:12],Y[15:12],c[3]);

endmodule

module adder4(S,Cout,A,B,Cin);
input [3:0] A,B;
input Cin;
output [3:0] S;
output Cout;
wire p0,g0,p1,g1,p2,g2,p3,g3;
wire c1,c2,c3;

assign p0 = A[0] ^ B[0],p1 = A[1] ^ B[1],p2 = A[2] ^ B[2],p3 = A[3] ^ B[3];

assign g0 = A[0] & B[0],g1 = A[1] & B[1],g2 = A[2] & B[2],g3 = A[3] & B[3];

assign c1 = g0|(p0&Cin), c2 = g1|(p1&g0)|(p1&p0&Cin),c3 = g2|(p2&g1)|(p2&p1&g0)|(p2&p1&p0&Cin),Cout = g3|(p3&g2)|(p3&p2&g1)|(p3&p2&p1&g0)|(p3&p2&p1&p0&Cin); 
       
assign S[0] = p0 ^ Cin;
assign S[1] = p1 ^ c1;
assign S[2] = p2 ^ c2;
assign S[3] = p3 ^ c3;

endmodule

