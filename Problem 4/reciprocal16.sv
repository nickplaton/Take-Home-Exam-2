module reciprocal16 (input  logic [3:0] n, output logic [15:0] reciprocal);

    always_comb begin
        priority case (n)
            4'b0000: reciprocal = 16'd31775;
            4'b0001: reciprocal = 16'd29959;
            4'b0010: reciprocal = 16'd28339;
            4'b0011: reciprocal = 16'd26886;
            4'b0100: reciprocal = 16'd25575;
            4'b0101: reciprocal = 16'd24385;
            4'b0110: reciprocal = 16'd23301;
            4'b0111: reciprocal = 16'd22310;
            4'b1000: reciprocal = 16'd21339;
            4'b1001: reciprocal = 16'd20560;
            4'b1010: reciprocal = 16'd19784;
            4'b1011: reciprocal = 16'd19065;
            4'b1100: reciprocal = 16'd18396;
            4'b1101: reciprocal = 16'd17772;
            4'b1110: reciprocal = 16'd17189;
            4'b1111: reciprocal = 16'd16644;
            default: reciprocal = 16'd31775;
        endcase
    end

endmodule
