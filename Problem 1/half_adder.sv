module half_adder (output logic cout, sum, input logic a, b);

    assign sum = a ^ b;
    assign cout = a & b;

endmodule