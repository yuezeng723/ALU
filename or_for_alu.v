module or_for_alu(data_operandA, data_operandB, data_result);
input [31:0] data_operandA;
input [31:0] data_operandB;
output [31:0] data_result;

generate
	genvar i;
	   for(i=0;i<32;i=i+1)
		begin:or_for_alu
			or or_for_alu(data_result[i], data_operandA[i], data_operandB[i]);
	   end
endgenerate


endmodule
