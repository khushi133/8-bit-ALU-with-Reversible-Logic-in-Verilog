`timescale 1ns / 1ps

module alu (
    output wire [7:0] D,        // 8-bit data output for all operations
    input wire [2:0] S,         // Control signals for the mux (3-bit select)
    input wire A,
    input wire B,
    input wire Cin,
    output wire Y,
    output wire Cout
);

    wire cout_out, borrow_out;
    wire and_out, or_out, xor_out, not_out;
    wire sum_out, diff_out, A_inc, A_com;

    // Instantiate logic gates
    logic_gates_peres logical (
        .A(A),
        .B(B),
        .AND(and_out),
        .OR(or_out),
        .XOR(xor_out),
        .NOT(not_out)
    );

    // Instantiate arithmetic operations
    arithmetic adder_sub_com_inc_dkg (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(sum_out),
        .Cout(cout_out),
        .Difference(diff_out),
        .Borrow(borrow_out),
        .Increment(A_inc),
        .Complement(A_com)
    );

    // Assign D signals based on each operation
    assign D[0] = and_out;
    assign D[1] = or_out;
    assign D[2] = xor_out;
    assign D[3] = not_out;
    assign D[4] = sum_out;
    assign D[5] = diff_out;
    assign D[6] = A_inc;
    assign D[7] = A_com;

    // Connect D and S to the mux to select the operation
    mux select (
        .D(D),
        .S(S),
        .Y(Y)
    );

    assign Cout = cout_out;  // Connect Cout output for cascading
endmodule
