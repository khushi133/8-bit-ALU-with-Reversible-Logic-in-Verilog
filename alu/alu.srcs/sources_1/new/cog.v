`timescale 1ns / 1ps

module cog (
    input wire A,
    input wire B,
    input wire C,
    output wire P,
    output wire Q,
    output wire R
);
    assign P = A;
    assign Q = (A & C) ^ (~A & B);
    assign R = (B & C) | (~B & ~C);

endmodule