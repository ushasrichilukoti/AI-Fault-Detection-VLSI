`timescale 1ns/1ps

module tb_fault;

reg [3:0] a;
reg [3:0] b;
wire [4:0] sum;

fault_adder uut(
    .a(a),
    .b(b),
    .sum(sum)
);

initial begin
    $dumpfile("fault_wave.vcd");
    $dumpvars(0, tb_fault);

    a = 0;  b = 0;   #10;
    a = 3;  b = 2;   #10;
    a = 7;  b = 5;   #10;
    a = 15; b = 1;   #10;

    $finish;
end

initial begin
    $monitor("Time=%0t a=%d b=%d sum=%d",
             $time, a, b, sum);
end

endmodule