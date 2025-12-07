module full_adder (output logic cout, sum, input logic a, b, cin);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule