module subtract(data_operandA, data_operandB, cout, data_result, overflow, isNotEqual, islessThan);
input [31:0] data_operandA;
input [31:0] data_operandB;
//input cin;//altough here is cin, but in subtracion, i assume cin is 1 to calculate b's complement
output cout;
output [31:0] data_result;
wire [31:0]invertb;
wire notuseoverflow;
wire msbcin0;
wire msbcin1;


wire w6;//w6 wire connect overflow and is_less_than. the andgate is just use to make it equal
output overflow;
wire notusethismsbcin;
wire msbcin;

wire w0; // w0 connect the cout of rca1 and selcet;
wire [15:0]w1;// rca2's sum(16 bits) and selcect in1(16 bits);
wire [15:0]w2;// rca3's sum(16 bits) and selcect in2(16 bitgs);
wire w3;// connect rca2's cout( 1 bit)
wire w4;// connect rca3's cout( 1 bit)

wire [31:0]invertsubtract;//the wire hold the invertsubtract.
wire w5;//connect andgate and inverter, compute to is_not_equal
output isNotEqual;

output islessThan;
wire [15:0]tempresult;//this is used to hold the substract[31:16]. this wire will be used to connect xor2 to detect the is_less_than

//calculate b'complement: first calculate invert b——interb, then let cin equals to 1 and get b's complement
//invert the b number
generate
	genvar i;
	   for(i=0;i<32;i=i+1)
		begin:notforb
			not not1(invertb[i], data_operandB[i]);
	   end
	endgenerate
	
//make substraction
//connect invertb and a to csa, let cin equals to 1. 
//use rca to make csa(for subtraction)
//rca(a, b, cin, cout, sum, msbcin);
rca rca1(data_operandA[15:0], invertb[15:0], 1, w0, data_result[15:0],notusethismsbcin);//although it has msbcin, we dont use it, call it notusethismsbcin,not coonect to anyhting
rca rca2(data_operandA[31:16], invertb[31:16], 0, w3, w1, msbcin0);//donnot use msbcin
rca rca3(data_operandA[31:16], invertb[31:16], 1, w4, w2, msbcin1);//donnot use msbcin

//accroding to the rca1's cout to select sum31to16, and assign each digit to sum32to16
generate
	genvar j;
	   for(j=0;j<16;j=j+1)
		begin:mux_2to1_16bit
			mux_2to1 mux_2to1_16bit(w0, w1[j], w2[j], tempresult[j]);
	   end
endgenerate

generate
	genvar l;
	   for(l=0;l<16;l=l+1)
		begin:extract_tempresult_to_sum
			and and3(data_result[l+16], 1, tempresult[l]);//this is just extract the tempresult and put them into the subtract31to16 box
	   end
endgenerate


//use mux to select the cout
mux_2to1 mux_for_cout(w0, w3, w4, cout);


//detect overflow
//this is select msbcarryinm and then use correct msbcarryin and cout to detect overflow
mux_2to1 mux_for_msbcin(w0, msbcin0, msbcin1, msbcin);//select the msbcin
xor xor_for_overflow(w6, msbcin, cout);//use xorgate to detect the overflow
and and0(overflow, 1, w6);//w6 equals to overflow, since the w6 is used to connect the is_less_than detection



//invert sum[31:0] to invertsum[31:0]
//use 33 input andgate to calculate the is_equal
//use a notgate to calculate is_not_equal
generate
	genvar k;
	   for(k=0;k<32;k=k+1)
		begin:invert_subtract
			not not2(invertsubtract[k], data_result[k]);
	   end
endgenerate

//w5 is the output of andgate, connect w5 to the notgate
and and1(w5,invertsubtract[0],invertsubtract[1],invertsubtract[2],invertsubtract[3],invertsubtract[4],invertsubtract[5],invertsubtract[6],
invertsubtract[7],invertsubtract[8],invertsubtract[9],invertsubtract[10],invertsubtract[11],invertsubtract[12],invertsubtract[13],invertsubtract[14],
invertsubtract[15],invertsubtract[16],invertsubtract[17],invertsubtract[18],invertsubtract[19],invertsubtract[20],invertsubtract[21],invertsubtract[22],
invertsubtract[23],invertsubtract[24],invertsubtract[25],invertsubtract[26],invertsubtract[27],invertsubtract[28],invertsubtract[29],invertsubtract[30],
invertsubtract[31], cout);

not not3(isNotEqual, w5);


//detect the is_less_than, use xorgate with input: subtract[31] and w6, w6 equals to overflow
xor xor_for_islessthan(islessThan, w6, tempresult[15]);//tempresult15 is subtract31, they are equal. w6 is the overflow, they are equal


endmodule
