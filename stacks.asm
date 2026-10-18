.text
MAIN:
	li $v0, 5
	syscall		#scanf("%d", &b);
	
	move $a0, $v0	# int b
	
	li $v0, 5
	syscall		#scanf("%d", &e);
	
	move $a1, $v0	#int e;
	
	jal POWER	# power(b,e)

	# print result
	sub $sp, $sp, 4
	sw $v0, 0($sp)
	
	sub $sp, $sp, 4
	sw $a0, 0($sp)
	
	#move $t3, $v0	# store result
	#move $t4, $a0	#store base

	
	lw $a0, ($sp)
	add, $sp, $sp, 4
	
	li $v0, 1
	syscall		#print base
	
	li $v0, 11
	li $a0, '^'
	syscall
	
	li $v0, 1
	move $a0, $a1
	syscall		#print exponent
	
	li $v0, 11
	li $a0, '='
	syscall
	

	lw $a0, ($sp)
	add, $sp, $sp, 4
	
	li $v0, 1
	syscall		#print result
	
	li $v0, 10
	syscall		# exit(0);
	
	

########################
# input: $a0 holds base
#	 $a1 holds exponent
# output: $v0 holds return value
# modified: $v0, $t2
########################

POWER:
	li $t2, 1	#int i = 1;
	li $v0, 1	# e = 1
	beq $a0, 0, EXPO_IS_0
	
	LOOP:	
		bgt $t2, $a1, DONE 
		mul $v0, $v0, $a0
		
		add $t2, $t2, 1
		j LOOP
	
	
	EXPO_IS_0: 
		li $v0, 1
	
	DONE:
		jr $ra
	
	