`timescale 1ns / 1ps

module dkg(
    input A,
    input B,
    input C,
    input D,
    output P,
    output Q,
    output R,
    output S
);
    assign P = B;
    assign Q = (~A & C) | (A & ~D);
    assign R = (A ^ B) & (C ^ D) ^ (C & D);
    assign S = B ^ C ^ D;
endmodule

