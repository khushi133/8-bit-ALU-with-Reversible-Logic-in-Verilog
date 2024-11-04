`timescale 1ns / 1ps

module mux (
    input wire [7:0] D,
    input wire [2:0] S,
    output wire Y
);

    wire P0, P1, P2, P3, P4, P5;
    wire S0, S1, S2;

    // First layer of cog gates to select between pairs of D[0] to D[7]
    cog gate0 (.B(D[0]), .C(D[1]), .A(S[2]), .P(), .Q(P0), .R());  // Select between D[0] and D[1]
    cog gate1 (.B(D[2]), .C(D[3]), .A(S[2]), .P(), .Q(P1), .R());  // Select between D[2] and D[3]
    cog gate2 (.B(D[4]), .C(D[5]), .A(S[2]), .P(), .Q(P2), .R());  // Select between D[4] and D[5]
    cog gate3 (.B(D[6]), .C(D[7]), .A(S[2]), .P(), .Q(P3), .R());  // Select between D[6] and D[7]

    // Second layer of cog gates to combine the first selections
    cog gate4 (.B(P0), .C(P1), .A(S[1]), .P(), .Q(P4), .R());      // Select between P0 and P1
    cog gate5 (.B(P2), .C(P3), .A(S[1]), .P(), .Q(P5), .R());      // Select between P2 and P3

    // Final cog gate to select the final output based on S[0]
    cog gate6 (.B(P4), .C(P5), .A(S[0]), .P(), .Q(Y), .R());       // Select the final Y output

endmodule