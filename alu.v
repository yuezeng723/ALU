module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;
	wire [31:0]data_result_csa, data_result_subtract, data_result_and, data_result_or, data_result_sll, data_result_sra, overflow_csa, overflow_subtract,
	isNotEqual_subtract,islessThan_subtract,  cout_csa, cout_subtract;

   // YOUR CODE HERE //
// csa(data_operandA, data_operandB, cin, cout, data_result, overflow)
	csa csa1(data_operandA, data_operandB,  cout_csa, data_result_csa, overflow_csa);
	
//subtract(data_operandA, data_operandB, cout, data_result, overflow, isNotEqual, islessThan)
	subtract subtract1(data_operandA, data_operandB, cout_subtract, data_result_subtract, overflow_subtract, isNotEqual_subtract, islessThan_subtract);
	
//sll(data_operandA, ctrl_shiftamt, data_result)
	sll sll1(data_operandA, ctrl_shiftamt, data_result_sll);
	
//sra(data_operandA, ctrl_shiftamt, data_result)
	sra sra1(data_operandA, ctrl_shiftamt, data_result_sra);
	
//and_for_alu(data_operandA, data_operandB, data_result)
	and_for_alu and1(data_operandA, data_operandB, data_result_and);
	
//or_for_alu(data_operandA, data_operandB, data_result)
	or_for_alu or1(data_operandA, data_operandB, data_result_or);

	
//select the option for result	
assign data_result = ctrl_ALUopcode[2] ? (
ctrl_ALUopcode[1] ? 
	32'h00000000
	:(ctrl_ALUopcode[0] ? 
			data_result_sra:data_result_sll))



:(ctrl_ALUopcode[1] ? 
	(ctrl_ALUopcode[0] ? 
		data_result_or:data_result_and)
	
	:(ctrl_ALUopcode[0] ? 
		data_result_subtract:data_result_csa));

//select the option for overflow	

assign overflow = ctrl_ALUopcode[2] ? 
	1'b0:(ctrl_ALUopcode[1] ? 
	1'b0:(ctrl_ALUopcode[0] ? 
overflow_subtract:overflow_csa));

//select the option for is_not_equal and is_less_than		
assign isNotEqual = ctrl_ALUopcode[2] ? 1'b0:(ctrl_ALUopcode[1] ? 1'b0:(ctrl_ALUopcode[0] ? isNotEqual_subtract:1'b0));
assign isLessThan = ctrl_ALUopcode[2] ? 1'b0:(ctrl_ALUopcode[1] ? 1'b0:(ctrl_ALUopcode[0] ? islessThan_subtract:1'b0));	
	
endmodule
