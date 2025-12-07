`timescale 1ns / 1ps

module prob1_tb ();

    logic [15:0]                  X;
    logic [11:0]                  Y;
    logic [27:0]                  Z;
    logic                       clk;
    logic [8:0]           vectornum;
    logic [8:0]              errors;
    logic [39:0] testvectors[255:0];
    logic [27:0]     golden_product;

    integer handle3;
    integer desc3;

    // instantiate device under test
    csam16x12tc dut (Z, X, Y);

    // 2 ns clock
    initial
        begin
            clk = 1'b1;
            forever #10 clk = ~clk;
        end

    initial
        begin
            handle3 = $fopen("prob1.out", "w");
            $readmemb("testvectors.tv", testvectors);
            vectornum = 0;
            errors = 0;
            desc3 = handle3;
            $fdisplay(
                desc3,
                " X:   Y:        Z:    Golden_Z Correct"
            );
        end
    
    // apply test vectors on clk rising edge
    always @(posedge clk)
        begin
            #1; {X, Y, golden_product} = testvectors[vectornum];
        end
    
    // check results on clk falling edge
    always @(negedge clk)
        begin
            if (Z != golden_product)
                errors = errors + 1;
            $fdisplay(
                desc3,
                "%h %h || %h %h || %h",
                X, Y,
                Z, golden_product,
                (Z == golden_product)
            );
            vectornum = vectornum + 1;
            if (testvectors[vectornum] === 256'bx)
                begin
                    $display("%d tests completed with %d errors", vectornum, errors);
                    $finish;
                end
        end

endmodule