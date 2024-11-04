`timescale 1ns / 1ps

module logic_gates_peres(
    input [7:0] A,              // 8-bit input A
    input [7:0] B,              // 8-bit input B
    output [7:0] AND,           // 8-bit AND output
    output [7:0] OR,            // 8-bit OR output
    output [7:0] XOR,           // 8-bit XOR output
    output [7:0] NOT            // 8-bit NOT output
);

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : bitwise_logic
            wire P, XOR_internal, AND_internal, OR_internal;

            // Instantiate peres gates for AND and XOR operations on each bit pair
            peres and_xor_gate (
                .A(A[i]),
                .B(B[i]),
                .C(1'b0),       // Set C to 0 for standard AND, XOR operations
                .P(P),
                .Q(XOR_internal),
                .R(AND_internal)
            );

            // Instantiate peres gate for OR operation on each bit pair
            peres or_gate (
                .A(~A[i]),      // Use complement inputs for OR functionality
                .B(~B[i]),
                .C(1'b1),       // Set C to 1 for OR functionality
                .P(),
                .Q(),
                .R(OR_internal)
            );

            assign AND[i] = AND_internal;
            assign XOR[i] = XOR_internal;
            assign OR[i] = OR_internal;
            assign NOT[i] = ~A[i];
        end
    endgenerate
endmodule
