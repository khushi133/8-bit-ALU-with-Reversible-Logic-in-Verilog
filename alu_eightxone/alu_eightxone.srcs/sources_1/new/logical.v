`timescale 1ns / 1ps

module logic_gates_peres(
    input A,
    input B,
    output AND,
    output OR,
    output XOR,
    output NOT
);
    wire P;
    wire XOR_internal;
    wire AND_internal;
    
    peres and_xorgate(.A(A), .B(B), .C(0), .P(P), .Q(XOR_internal), .R(AND_internal));
    peres or_xorgate(.A(~A), .B(~B), .C(1), .P(P), .Q(XOR_internal), .R(OR));
    notgate not_op(.A(A), .B(NOT));
    
    assign AND = AND_internal;
    assign XOR = XOR_internal;
endmodule