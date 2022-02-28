# Project Checkpoint 1
 - Author: Yue Zeng (yz723)
 - Date: 2021/9/20
 - Course: ECE 550DK, Dukekunshan University, China
 - Term: fall 2021
 - Professor Xin LI

## Duke Community Standard, Affirmation
 I affirm that each submission complies with the Duke Community Standard and the guidelines set forth for this assignment.  

## Description of My Design Implementation

I wrote 9 files to complete this project, including fa.v (1bit full adder), rca.v(16bit ripple carry adder), mux_2to1.v(2:1mux), csa.v (32bit adder), subtract.v(32 bit subtractor), and_for_alu.v(and), or_for_alu.v(or), sll.v(logic left shifter), sra.v(arithmetic right shifter ). I will introduce the implement of this 9 files, and complete my introduction in 6 sections.

### section 1	32bit Adder

I make a 32bit carry select adder by using three 16bit ripple carry adders and one 2:1mux. The first RCA is used to compute the  0 to 15 digits of sum, and carry out of this part. This carry out will be used as a select input to select the 16 to 31 digits of sum. The result of 32bit adder will be composed by the 0 to 15digits of sum, and  16 to 31 digits of sum.

After getting the result, I use XOR gate to detect the overflow. As professor said in class, in signed addition, the overflow is carry-in of the most significant bit XOR carry-out of the most significant bit. So I connect this two number to the XOR gate as input, and the overflow as output of the XOR gate. When overflow occurs,  overflow will equals to 1. Otherwise, it equals to 0. 

### section 2	32bit Subtractor

Based on binary complement, I use three 16bit ripple carry adders, not gate, and 2:1mux to build this subtractor. To obtain the complement of operand B, I use a loop to flip its every digit, and make carry-in equals to 1 in the first ripple carry adder. The carry out of the first ripple carry adder is used as a select input to select the 16 to 31digits of subtraction result.  Like the adder I mentioned before, the subtraction result will also be composed by the 0 to 15 digits of subtraction result and 16 to 31 digits of selected subtraction result.

After getting the result, I also use XOR gate the detect the overflow. According  to the truth table, the overflow of the subtraction is also represented by the carry-in of the most significant bit of result XOR carry-out of the most significant bit of result. So I connect this two number to the XOR gate as input, and the overflow as output of the XOR gate. When overflow occurs,  overflow will equals to 1. Otherwise, it equals to 0. 

Next, I detect the is_not_equal by using 0 to 31 digits of the result and the carry-out of the most significant bit of the result. According to the truth table, only when all 32 digits of the result equals to 0 and carry-out equals to 1, the operand A and operand B are equal.  So I used NOT gate to flip 32 digits of result one by one, and then make these 32 digits and carry-out all as the input of an AND gate. The output of this AND gate is connect to another NOT gate, and is_not_equal will be the output of this NOT gate.

Finally in this section, I detect is_less_than by using the overflow and the most significant bit of result. According to the truth table, is_less_than equals to overflow XOR most significant bit of result. In hardware, I make overflow and most significant bit of result as two input of a XOR gate, and  is_less_than as the output.

### section 3	SLL

In SLL, I use 5 conditional statements to complete the computation. Since the input of shift amount is 5 bit binary, so I each condition statement will detect whether each bit is 0 or 1, and based on the condition to execute the statement.

For example, when shift amount is 5'b 00101, which means the operand A should logic left shift 5 digits, the first conditional statement will execute since the first digit is 1, true for the condition, and the A will left reserve its 30 to 0 digits, and add 1 bit 0 at the end of the right. Then, it comes into the second statement, since the second digit of the shift amount is 0, false for the condition, and the it will not change. Next, it comes into the third statement, since the third digit of the shift amount is 1, true for the condition, and it will reserve 27 to 0 digit of the A, and add four 0 and the end of right. For condition four and condition five, since the fourth and fifth digit of shift amount are 0, false for the condition, the A will not change at these two steps. In general, the A left shift : 1 plus 4 equals to  5 digit.   

The input of shift amount ranges from 00000 to 11111. Every shift amount will be executed follow the principles as in the above example.



### section 4 SRA

In SLL, I use 11 conditional statements to complete the computation. Since the input of shift amount is 5 bit binary, so I each condition statement will detect whether each bit is 0 or 1, and based on the condition to execute the statement. Since the main logic of SRA is similar like the example above, but need to change the shift direction and the detect the most significant bit of the operand. I will not go through the example again, but detailly introduce the different executions and principles. 

Unlike the logic shift, the arithmetic right shift depend on the mist significant bit of the operand A. If 31 digit of A is 1, then after shifting it will use 1 to fill up the blank. Otherwise, it will use 0 to fill up the blank. 

The condition statement 1 to 5 computes the result assuming that the most significant bit of operand A is 0, while the condition statement 6 to 10 computes another result assuming that the most significant bit of operand A is 1. The last statement, the conditional statement 11, is actually select correct answer from two result, basing on the 31th digit of A. If the most significant bit of A is 1, truth for the condition, the  result assuming that msb is 1 will be selected. If the most significant bit of A is 0, false for the condition, the result assuming that msb is 0 will be selected.



### section 5 	AND

In this section, I make a loop and use AND gate to compute the result bit by bit. 

### section 6	OR

 In this section, I make a loop and use OR gate to compute the result bit by bit.



