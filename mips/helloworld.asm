.text

MAIN:
	li $v0, 5		#load 5(syscall for reading int) into $v0
	syscall			#execute
	move $t0, $v0		# move data from $v0 to $t0
	
	bge $t0, 0, DONE		# if number in $t0 is greater than or equal to 0 i.e positive, branch to DONE
	mul $t0, $t0, -1		# multiply $t0 by -1 and store it back in $t0
	
DONE:
	move $a0, $t0		#move number from $t0 to $a0 