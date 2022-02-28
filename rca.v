//this is a 16bit rca, the input should be 16bits
module rca(a, b, cin, cout, sum,msbcin);
input [15:0] a; 
input [15:0] b;
input  cin;
output cout; 
output [15:0] sum;

//add this new thing!!!!!!
output msbcin;

wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;

fa fa0(.a(a[0]), .b(b[0]), .cin(cin), .cout(w0), .sum(sum[0]));
fa fa1(.a(a[1]), .b(b[1]), .cin(w0), .cout(w1), .sum(sum[1]));
fa fa2(.a(a[2]), .b(b[2]), .cin(w1), .cout(w2), .sum(sum[2]));
fa fa3(.a(a[3]), .b(b[3]), .cin(w2), .cout(w3), .sum(sum[3]));
fa fa4(.a(a[4]), .b(b[4]), .cin(w3), .cout(w4), .sum(sum[4]));
fa fa5(.a(a[5]), .b(b[5]), .cin(w4), .cout(w5), .sum(sum[5]));
fa fa6(.a(a[6]), .b(b[6]), .cin(w5), .cout(w6), .sum(sum[6]));
fa fa7(.a(a[7]), .b(b[7]), .cin(w6), .cout(w7), .sum(sum[7]));
fa fa8(.a(a[8]), .b(b[8]), .cin(w7), .cout(w8), .sum(sum[8]));
fa fa9(.a(a[9]), .b(b[9]), .cin(w8), .cout(w9), .sum(sum[9]));
fa fa10(.a(a[10]), .b(b[10]), .cin(w9), .cout(w10), .sum(sum[10]));
fa fa11(.a(a[11]), .b(b[11]), .cin(w10), .cout(w11), .sum(sum[11]));
fa fa12(.a(a[12]), .b(b[12]), .cin(w11), .cout(w12), .sum(sum[12]));
fa fa13(.a(a[13]), .b(b[13]), .cin(w12), .cout(w13), .sum(sum[13]));
fa fa14(.a(a[14]), .b(b[14]), .cin(w13), .cout(w14), .sum(sum[14]));
fa fa15(.a(a[15]), .b(b[15]), .cin(w14), .cout(cout), .sum(sum[15]));


//add this new thing!!!!
and and_for_msbcin(msbcin, w14, 1);

endmodule
