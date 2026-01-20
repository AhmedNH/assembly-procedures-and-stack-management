s1:	DC	"Enter two positive\nintegers a and b.\0" // define characters and stores the result in s1
c2:	DC	"Int a: " // define characters and stores the result in s2
c3:	DC	"Int b: " // define characters and stores the result in s3
s4:	DC	"GCD of a and b:" // define characters and stores the result in s4
	addi	sp, x0, 0 // sp initialization
	addi 	x28, x0, s1 // adds x0 to s1 and stores it in x28
	ld	x29, c2(x0) // loads c2 in x29
	ld	x30, c3(x0) // loads c3 in x30
	addi	x31, x0, s4 // adds x0 to s4 and stores it in x31
	ecall 	x0, x28, 4 // prints string in x28
	ecall	a1, x29, 5 // input an integer and stores it in a1 (int a)
	ecall	a0, x30, 5 // input an integer and stores it in a0 (int b)
	jal	x1, gcd // calls gcd
	ebreak	x0, x0, 0 // triggers a breakpoint
gcd:	bne	a0, x0, recu // if (a0 != x0) go to recu
	add	a0, x0, a1 // return a1 if (a0 == x0)
	addi	sp, sp, 24 // pop 3 items off stack
	jalr	x0, 0(x1) // return to the return address stored in x1
recu:	sd	x1, -8(sp) // push return address
	sd	a1, -16(sp) // push a1
	sd	a0, -24(sp) // push a0
	addi	sp, sp, -24 // adjust sp
	add	x6, x0, a0 // x6 = x0 + a0
	rem	a0, a1, a0 // a0 = a1 % a0
	add	a1, x0, x6 // a1 = x0 + x6
	jal	x1, gcd // recursive call
	addi	sp, sp, 24 // adjust sp
	ld	x1, -8(sp) // pop return address
	ld	a1, -16(sp) // pop a1
	ld	a0, -24(sp) // pop a0
	add	a1, x0, x6 // a1 = x0 + x6
	ecall 	x0, x31, 4 // prints string in x31
	ecall 	x0, a1, 0 // prints integer in a1
	jalr	x0, 0(x1) // return back to the return address stored in x1