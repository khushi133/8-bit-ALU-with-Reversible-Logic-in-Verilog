`timescale 1ns / 1ps

module peres(
    input A,
    input B,
    input C,
    output P,
    output Q,
    output R
);

assign P = A;
assign Q = A ^ B;
assign R = C ^ (A & B);

endmodule