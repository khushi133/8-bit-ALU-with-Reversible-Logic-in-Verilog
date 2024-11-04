`timescale 1ns / 1ps

module arithmetic(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout,
    output Difference,
    output Borrow,
    output Increment,
    output Complement
);
    wire P1, Q1, R1, S1;
    wire P2, Q2, R2, S2;
    wire P3, Q3, R3, S3;

    // Adder (for Sum and Cout)
    dkg adder (
        .A(1'b0),
        .B(A),
        .C(Cin),
        .D(B),
        .P(P1),
        .Q(Q1),
        .R(R1),
        .S(S1)
    );

    // Subtractor (for Difference and Borrow)
    dkg subtractor (
        .A(1'b1),
        .B(A),
        .C(Cin),
        .D(B),
        .P(P2),
        .Q(Q2),
        .R(R2),
        .S(S2)
    );

    // Incrementer (A + 1)
    dkg incrementer (
        .A(1'b0),
        .B(A),
        .C(1'b0),
        .D(1'b1),
        .P(),
        .Q(),
        .R(),
        .S(S3)  // Using S3 as the Increment output
    );

    // Complement (1's complement of A)
    dkg complement (
        .A(1'b0),
        .B(A),
        .C(1'b1),
        .D(1'b0),
        .P(),
        .Q(),
        .R(),
        .S(P3)  // Using P3 as the Complement output
    );

    // Assign outputs
    assign Sum = S1;
    assign Cout = R1;
    assign Difference = S2;
    assign Borrow = R2;
    assign Increment = S3;
    assign Complement = P3;
endmodule
