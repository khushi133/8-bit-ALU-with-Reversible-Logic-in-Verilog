`timescale 1ns / 1ps

module alu_8bit_tb;

    // Testbench signals
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    reg [2:0] S;
    wire [7:0] Y;
    wire Cout;

    // Instantiate the ALU 8-bit module
    alu_8bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Y(Y),
        .Cout(Cout)
    );

    // Test procedure
    initial begin
        // Initialize all signals
        A = 8'b00000000;
        B = 8'b00000000;
        Cin = 1'b0;
        S = 3'b000;
        #5;
        
        // Test Case 1: Add operation
        A = 8'b00001111; B = 8'b00000001; Cin = 1'b0; S = 3'b000;
        #20;

        // Test Case 2: Subtract operation
        A = 8'b00001111; B = 8'b00000001; Cin = 1'b0; S = 3'b001;
        #20;

        // Test Case 3: AND operation
        A = 8'b10101010; B = 8'b11001100; S = 3'b010;
        #20;

        // Test Case 4: OR operation
        A = 8'b10101010; B = 8'b11001100; S = 3'b011;
        #20;

        // Test Case 5: XOR operation
        A = 8'b10101010; B = 8'b11001100; S = 3'b100;
        #20;

        // Test Case 6: NOT operation (on A)
        A = 8'b11110000; S = 3'b101;
        #20;
        
        // Test Case 6: NOT operation (on A)
        A = 8'b11110000; S = 3'b110;
        #20;
        
        // Test Case 6: NOT operation (on A)
        A = 8'b11110000; S = 3'b111;
        #20;

        $stop;  // End simulation
    end

endmodule
