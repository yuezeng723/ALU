module sll(data_operandA, ctrl_shiftamt, data_result);
input [31:0] data_operandA;
input [4:0] ctrl_shiftamt;
output [31:0] data_result;
wire [31:0] w1, w2, w3, w4;

//if condition shiftamount[0] is true, which means decimal shiftamount equals to 1. left sheft 1 bit, otherwise 0 bit
assign w1 = ctrl_shiftamt[0]?{data_operandA[30 : 0],1'b0}: data_operandA[31:0];

//if condition shiftamount[1] is true, which means decimal shiftamount should plus 2 (2^1). 
assign w2 = ctrl_shiftamt[1]?{w1[29 : 0],2'b00}: w1;

//if condition shiftamount[2] is true, which means decimal shiftamount should plus 4 (2^2). 
assign w3 = ctrl_shiftamt[2]?{w2[27 : 0],4'b0000}: w2;

//if condition shiftamount[3] is true, which means decimal shiftamount should plus 8 (2^3). 
assign w4 = ctrl_shiftamt[3]?{w3[23 : 0],8'b00000000}: w3;

//if condition shiftamount[4] is true, which means decimal shiftamount should plus 16 (2^4). 
assign data_result = ctrl_shiftamt[4]?{w4[15 : 0],16'b0000000000000000}: w4;


endmodule
