`timescale 1ns / 1ps

module alu (
    input wire [7:0] D,        // 8-bit data input containing operation results
    input wire [2:0] S,        // Control signals for the mux (3-bit select)
    input wire [7:0] A,        // 8-bit input A
    input wire [7:0] B,        // 8-bit input B
    input wire Cin,            // Carry-in for the LSB
    output wire [7:0] Y,       // ALU result output
    output wire Cout           // Carry-out from the MSB
);

    wire [7:0] cout_wire;       // Carry-out wires between ALU units
    wire [7:0] alu_output;      // Output of each 1-bit ALU unit

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : alu_bit
            alu alu_1bit (
                .D(alu_output),                 // Connect to the 1-bit ALU output
                .S(S),
                .A(A[i]),
                .B(B[i]),
                .Cin(i == 0 ? Cin : cout_wire[i-1]), // Use previous carry-out as Cin for the next bit
                .Y(Y[i]),
                .Cout(cout_wire[i])             // Carry-out for this bit
            );
        end
    endgenerate

    assign Cout = cout_wire[7]; // Carry-out from the MSB
endmodule
