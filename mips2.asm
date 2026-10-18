#.data
# message: .asciiz "Hello world"
#.text
#MAIN:
#	li $v0, 4
#	la $a0, message
#	syscall
#	
#	li $v0, 10
#	syscall

#calculate average of elements in an array

.data
	array: .word 10,11,12,15,29
	
	message: .asciiz "The average of the elements in the array is: "
	
.text
MAIN:
	li $t0, 0		#iterator
	li $t1, 5		#num of elements in the array
	li $t3, 0		#variable to hold the sum of elements in the array
	LOOP:
		bge $t0, $t1, DONE	#if iterator >= size of array, goto DONE
		mul $t4, $t0, 4		#$t4 = 4*$t0; this stores the next offset to be used to get the next item in the array
		lw $t5, array($t4)	# load the element at (original array address + $t4) into $t5  
		add $t3, $t3, $t5	# $t3 = $t3+$t5 i.e accumalate
		add $t0, $t0, 1		#increment the iterator by 1
		
		j LOOP			# jump to or goto LOOP
	DONE:
	#compute average
	div $t6, $t3, $t1
	
	#print message
	li $v0, 4
	la $a0, message
	syscall
	
	#print average
	li $v0, 1
	move $a0, $t6
	syscall
	
	#halt program
	li $v0, 10
	syscall
	
	
	
	
	
	
		
			
				
					
							