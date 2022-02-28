module sra(data_operandA, ctrl_shiftamt, data_result);
input [31:0] data_operandA;
input [4:0] ctrl_shiftamt;
output [31:0] data_result;
wire [31:0] w1, w2, w3, w4, w5, w6, w7, w8;
wire [31:0] data_result0, data_result1;

//if data_operandA[31] = 0
assign w1 = ctrl_shiftamt[0]?{1'b0, data_operandA[31:1]}: data_operandA[31:0];

assign w2 = ctrl_shiftamt[1]?{2'b00,w1[31:2]}: w1;

assign w3 = ctrl_shiftamt[2]?{4'b0000,w2[31:4]}: w2;

assign w4 = ctrl_shiftamt[3]?{8'b00000000,w3[31:8]}: w3;

assign data_result0= ctrl_shiftamt[4]?{16'b0000000000000000,w4[31:16]}: w4;


//if data_operandA[31] = 1
assign w5 = ctrl_shiftamt[0]?{1'b1, data_operandA[31:1]}: data_operandA[31:0];

assign w6 = ctrl_shiftamt[1]?{2'b11,w5[31:2]}: w5;

assign w7 = ctrl_shiftamt[2]?{4'b1111,w6[31:4]}: w6;

assign w8 = ctrl_shiftamt[3]?{8'b11111111,w7[31:8]}: w7;

assign data_result1= ctrl_shiftamt[4]?{16'b1111111111111111,w8[31:16]}: w8;


//select the output based on the data_operandA[31]
assign data_result = data_operandA[31]? data_result1: data_result0;


endmodule
