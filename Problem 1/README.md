# Problem 3: CSAM 16x16

*Using the Perl CSAM generator, generate a carry-save array multiplier for n = 16 and m = 12 in Verilog. Modify the SystemVerilog to handle two’s complement numbers and test with 256 valid two’s complement vectors. Hint: do not shortcut the mathematical process – formulate the equation just as we did in class to understand how to modify the SystemVerilog to handle two’s complement arithmetic.*

To run in GUI, use
> vsim -do prob1.do

To run without GUI, use
> vsim -do prob1.do -c

Both will output results to `prob1.out` in the format:
*X Y || Z Golden || Correct*
