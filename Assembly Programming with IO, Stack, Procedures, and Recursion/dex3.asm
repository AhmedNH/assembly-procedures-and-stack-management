c:	DM 	3 // storage space of 3 double-words is reserved
str1:	DC	"sampled text\0" // define characters and stores the result in str1
str2:	DC	"new\0" // define characters and stores the result in str2
s3:	DC	"Do you want to delete\nor insert a character?\nType 0 to delete.\nType 1 to insert.\0" // define characters and stores the result in s3
	addi	x28, x0, s3 // x28 = x0 + s3
	ecall	x0, x28, 4 // prints the string stored in x28
	ecall	x29, x0, 5 // input an integer and stores it in x29
	addi	x30, x0, 1	 // x30 = x0 + 1
	beq	x29, x0, delete // if (x29 == x0) go to delete
	beq	x29, x30, insert // if (x29 == x30) go to insert

delete:	addi	a2, x0, str1 + 6 // character address
	addi	a3, x0, 6 // number of character
	jal	x1, delch // calls delch
	addi	x6, x0, str1 // output
	ecall	x0, x6, 4 // prints the string in x6
	ebreak	x0, x0, 0 // triggers a breakpoint
delch:	sd	x1, c(x0) // store c in x1
	sd	s0, c+8(x0) // store c+8 in s0
	sd	s1, c+16(x0) // store c+16 in s1
	addi	s0, a2, 0 // s0 = a2 + 0
	addi	s1, a3, 0 // s1 = a3 + 0
	bge	x0, s1, end2 // if (x0 >= s1) go to end2
loop2:	jal	x1, delch1 // calls delch1
	addi	a2, s0, 0 // a2 = s0 + 0
	addi	s1, s1, -1 // s1 = s1 - 1
	bne	s1, x0, loop2 // if (s1 != x0) go to loop2
end2:	ld	x1, c(x0) // loads c into x1
	ld	s0, c+8(x0) // loads c+8 into s0
	ld	s1, c+16(x0) // loads c+16 into s1
	jalr	x0, 0(x1) // return back to the return address stored in x1
delch1:	lb	x5, 0(a2) // loads a2 into x5
loop1:	beq	x5, x0, end1 // if (x5 == x0) go to end1
	lb	x5, 1(a2) // loads 1 + a2 into x5
	sb	x5, 0(a2) // loads a2 into x5
	addi	a2, a2, 1 // a2 = a2 + 1
	jal	x0, loop1 // calls loop1
end1:	jalr	x0, 0(x1) // return back to the return address stored in x1


insert:	addi 	a2, x0, str2 + 7 // character address
	addi 	a3, x0, str1 // character address
	jal 	x1, insch // calls insch
	addi 	x6, x0, str1 // output
	ecall 	x0, x6, 4 // prints string stores in x6
	ebreak 	x0, x0, 0 // triggers a breakpoint
insch1:	lb 	x5, 0(a2) // loads a2 in x5
	sb 	a3, 0(a2) // stores a2 in a3
	addi 	a3, x5, 0 // a3 = x5 + 0
	addi 	a2, a2, 1 // a2 = a2 + 1
	bne 	a3, x0, insch1 // if (a3 != x0) go to insch1
	sb 	a3, 0(a2) // stores a2 in a3
	jalr 	x0, 0(x1) // return back to the return address stored in x1
insch:	sd 	x1, c(x0) // stores x in x1
	sd 	s0, c+8(x0) // stores c+8 in s0
	sd 	s1, c+16(x0) // stores c+16 in s1
	addi 	s0, a2, 0 // s0 = a2 + 0
	addi 	s1, a3, 0 // s1 = a3 + 0
loop3: 	lb 	a3, 0(s1) // loads s1 in a3
	beq 	a3, x0, end3 // if (a3 == x0) go to end3
	jal 	x1, insch1 // calls insch1
	addi 	s0, s0, 1 // s0 = s0 + 1
	addi 	a2, s0, 0 // a2 = s0 + 0
	addi 	s1, s1, 1 // s1 = s1 + 1
	beq 	x0, x0, loop3 // if (x0 == x0) go to loop3
end3: 	ld 	x1, c(x0) // loads c in x1
	ld 	s0, c+8(x0) // loads c+8 in s0
	ld 	s1, c+16(x0) // loads c+16 in s1
	jalr 	x0, 0(x1) // return back to the return address stored in x1
