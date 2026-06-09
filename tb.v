`timescale 1ns/1ps

module tb;

reg clk;
reg [3:0] a;
reg [3:0] b;
wire [4:0] sum;

initial begin
    clk = 0;
end

always #5 clk = ~clk;

adder uut(
    .a(a),
    .b(b),
    .sum(sum)
);
initial begin
    $monitor("Time=%0t a=%d b=%d sum=%d",
             $time, a, b, sum);
end

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, tb);

    a = 0;  b = 0;
    #10;

    a = 3;  b = 2;
    #10;

    a = 7;  b = 5;
    #10;

    a = 15; b = 1;
    #10;

    $finish;

end

endmodule