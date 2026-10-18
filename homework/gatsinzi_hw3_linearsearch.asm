.data
	array: .word 1,2,3,4,5,6,7,8,9,10,0

.text
MAIN:
	li $a0, 5	# $t0 will store the key we that the search will look for
	jal SEARCH
	
	move $a0, $v0	# copy SEARCH's return value to $a0
	li $v0, 1
	syscall		# print index where the key was found
	
	li $v0, 10
	syscall		# end program
	
##################
# input: $a0 -> key value that the search function will look for
# output: $v0 -> index of the key value if found; else -1 
##################
SEARCH:
	li $t0, 0	# int i = 0; 
	li $t1, 0	# int found = 0; 
	
	LOOP:
		bne $t1, 0, DONE	# if (found != 0) goto done;
		
		mul $v0, $t0, 4		# $v0 = i*4 i.e store offset in $v0
		la $a1, array		# $a1 = address of array
		add $a1, $v0, $a1	# apply offset and store the address of the i'th element in $a1
		
		lw $t2, 0($a1)		# $t2 = array[i]
		beq $t2, 0, DONE	# goto DONE if current element $t2 = 0; i.e loop has reached end of the array
		bne $t2, $a0, STEP	# if (X[i] != key) goto STEP i.e just continue the loop
		
		li $t1, 1		# found = 1 i.e if the program reaches here, the element has been found
		j LOOP
	STEP:
		add $t0, $t0, 1		# i++;
		j LOOP
	
	DONE:
		beq $t1, 0, NOT_FOUND	# Branch to NOT_FOUND if loop ends and found is still 0
		move $v0, $t0			# store the index where the key was found in the return variable
		j EXIT
	
	NOT_FOUND:
		li $v0, -1			# return -1 if key $a0 not found in the array
	EXIT:
		jr $ra				# return to the address the function was called from
		
		
		