.data
	message: .asciiz "You entered: "

.text
MAIN:
	#read int
	li $v0 5		# store syscall 5(for reading ints) into the function selector register $v0
	syscall
	
	#move read int from $v0 to $t0
	move $t0, $v0
	
	#print message
	li $v0, 4
	la $a0, message
	syscall
	
	
	# load 1 into $v0(syscall to print integers)
	li $v0, 1
	
	#move int into $a0 argument list 
	move $a0, $t0
	
	syscall
	
	li $v0, 10
	syscall
	