`timescale 1ns / 1ps
module alu_tb;

    reg [2:0] S;
    reg A, B, Cin;
    wire Y;
    wire [7:0] D;

    alu uut (
        .D(D),
        .S(S),
        .A(A),
        .B(B),
        .Cin(Cin),
        .Y(Y)
    );

    initial begin
        $monitor("Time: %0d A=%b, B=%b, Cin=%b, S=%b, Y=%b", $time, A, B, Cin, S, Y);
        
        A = 0; B = 0; Cin = 0; S = 3'b000;

        // Test AND operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b000;
        #10 A = 1; B = 1; Cin = 0; S = 3'b000;

        // Test SUM operation
        #10 A = 0; B = 1; Cin = 0; S = 3'b001;
        #10 A = 0; B = 1; Cin = 1; S = 3'b001;
        #10 A = 1; B = 1; Cin = 1; S = 3'b001;

        // Test XOR operation
        #10 A = 0; B = 1; Cin = 0; S = 3'b010;
        #10 A = 1; B = 1; Cin = 0; S = 3'b010;

        // Test OR operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b100;
        #10 A = 1; B = 1; Cin = 0; S = 3'b100;

        // Test DIFF operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b101;
        #10 A = 1; B = 1; Cin = 0; S = 3'b101;
        
        // Test NOT operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b110;
        #10 A = 0; B = 0; Cin = 0; S = 3'b110;
        
        // Test INC operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b011;
        #10 A = 0; B = 0; Cin = 0; S = 3'b011;
        
        // Test COM operation
        #10 A = 1; B = 0; Cin = 0; S = 3'b111;
        #10 A = 0; B = 0; Cin = 0; S = 3'b111;
        
        #10 $stop;
    end

endmodule