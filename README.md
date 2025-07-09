# 16-bit-carry-look-ahead-adder
This project implements a 16-bit carry lookahead adder in Verilog HDL, constructed using a hierarchical design approach with four reusable 4-bit CLA modules. In addition to computing the sum of two 16-bit inputs, the design also generates standard ALU status flags — Sign, Zero, Carry, Parity, and Overflow — making it suitable for use in arithmetic logic units (ALUs) or educational processors.

we first generate the carry and propagate by looking into the values of A and B.
if A and B are both 1, we generate the carry (AND function).
if only one of A or B is 1, we generate the propagate (XOR function).

sum is calculated as usual by XORing the inputs and carryin. simplified as propagate XORed with carryin.
carry is calculated by Ci = G(i-1) | P(i-1)&C(i-1);
