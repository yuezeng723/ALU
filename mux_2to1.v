//this is 16bit 2:1 mux, the input should be 16bits, the output should be 16bits.
// if select=1, then ouput= in2;  
//if select = 0, then ouput =in1;
module mux_2to1(select, in1, in2, out);
input select; // select is 1bit
input in1;
input in2;
output out;
wire w1;
wire w2;
wire w3;

not not1(w1, select);
and and1(w2, in1, w1);
and and2(w3, select,in2);
or or1(out, w2, w3);

endmodule

