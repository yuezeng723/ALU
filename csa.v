module csa(data_operandA, data_operandB, cout, data_result, overflow);
input [31:0] data_operandA;
input [31:0] data_operandB;
output cout;
output [31:0] data_result;

output overflow;
wire msbcin0, msbcin1;
wire msbcin;//connect the msbcin and xor gate, used to detect overflow
wire notusethismsbcin;




wire w0; // w0 connect the cout of rca1 and selcet;
wire [15:0]w1;// rca2's sum(16 bits) and selcect in1(16 bits);
wire [15:0]w2;// rca3's sum(16 bits) and selcect in2(16 bits);
wire w3;// connect rca2's cout( 1 bit)
wire w4;// connect rca3's cout( 1 bit)


//rca(a, b, cin, cout, sum, msbcin);

rca rca1(data_operandA[15:0], data_operandB[15:0], 0, w0, data_result[15:0],notusethismsbcin);//although it has msbcin, we dont use it, call it notusethismsbcin,not coonect to anyhting
rca rca2(data_operandA[31:16], data_operandB[31:16], 0, w3, w1, msbcin0);//msb carry-in is msbcin0
rca rca3(data_operandA[31:16], data_operandB[31:16], 1, w4, w2, msbcin1);//msb carry-in is msbcin1

//make 16 bit 2:1 mux, then select the sum[31:16]
//16 bit 2:1 mux must use 16 1bit 2:1 mux.
// mux_2to1(select, in1, in2, out), if select=1,out=in2;
generate
	genvar i;
	   for(i=16;i<32;i=i+1)
		begin:mux_2to1_16bit
			mux_2to1 mux_2to1_16bit(w0, w1[i-16], w2[i-16], data_result[i]);
	   end
endgenerate
	
//use 1bit 2:1 mux to select the cout
mux_2to1 mux_for_cout(w0, w3, w4, cout);


//this is select msbcarryinm and then use correct msbcarryin and cout to detect overflow
mux_2to1 mux_for_msbcin(w0, msbcin0, msbcin1, msbcin);//select the msbcin
xor xor_for_overflow(overflow, msbcin, cout);//use xorgate to detect the overflow

endmodule
