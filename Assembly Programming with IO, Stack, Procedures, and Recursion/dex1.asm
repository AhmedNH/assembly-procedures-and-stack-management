s1:	DC	"What is your name?" // defines the sequence of characters and stores the result in s1
s2:	DC	"Hello " // defines the sequence of characters and stores the result in s2
s3:	DC	"!" // defines the sequence of characters and stores the result in s3
	addi	x6, x0, s1 // adds x0 to x1 and stores the result in x6
	addi	x7, x0, s2 // adds x0 to s2 and stores the result in x7
	addi	x5, x0, s3 // adds x0 to s3 and stores the result in x5
	ecall 	x0, x6, 4 // calls this function to print x6, which is a string
	ecall	x28, x0, 9 // calls this function to input a string and stores the result in x28
	ecall	x29, x7, 4 // calls this function to print x7, which is a string and stores the result in x29
	ecall	x30, x28, 4 // calls this function to print x28, which is a string and stores the result in x30
	ecall	x31, x5, 4 // calls this function to print x5, which is a string and stores the result in x31