.data

IN_BUFFER: 	.space 80 # input line
TYPE_BUFFER: 	.space 80 # char types for the input line
PROMPT: 	.asciiz "Enter a new input line: \n”

CHAR_TABLE:
	.word 0x09, 6	# tab
	.word 0x0a, 6	# line feed
	.word 0x0d, 6	# carraige return
	.word ' ', 6
	.word 0x23, 5	# 0x23 is the ascii value for '#' in hexadecimal
	.word 0x24, 4	# 0x24 is the ascii value for '$' in hexadecimal
	.word '(', 4
	.word ')', 4
	.word '*', 3
	.word '+', 3
	.word ',', 4
	.word '-', 3
	.word '.', 4
	.word '/', 3
	.word '0', 1
        .word '1', 1
        .word '2', 1
        .word '3', 1
        .word '4', 1
        .word '5', 1
        .word '6', 1
        .word '7', 1
        .word '8', 1
        .word '9', 1
        .word ':', 4
        .word 'A', 2
        .word 'B', 2
        .word 'C', 2
        .word 'D', 2
        .word 'E', 2
        .word 'F', 2
        .word 'G', 2
        .word 'H', 2
        .word 'I', 2
        .word 'J', 2
        .word 'K', 2
        .word 'L', 2
        .word 'M', 2
        .word 'N', 2
        .word 'O', 2
        .word 'P', 2
        .word 'Q', 2
        .word 'R', 2
        .word 'S', 2
        .word 'T', 2
        .word 'U', 2
        .word 'V', 2
        .word 'W', 2
        .word 'X', 2
        .word 'Y', 2
        .word 'Z', 2
        .word 'a', 2
        .word 'b', 2
        .word 'c', 2
        .word 'd', 2
        .word 'e', 2
        .word 'f', 2
        .word 'g', 2
        .word 'h', 2
        .word 'i', 2
        .word 'j', 2
        .word 'k', 2
        .word 'l', 2
        .word 'm', 2
        .word 'n', 2
        .word 'o', 2
        .word 'p', 2
        .word 'q', 2
        .word 'r', 2
        .word 's', 2
        .word 't', 2
        .word 'u', 2
        .word 'v', 2
        .word 'w', 2
        .word 'x', 2
        .word 'y', 2
        .word 'z', 2
        .word 0x5c, -1 # ‘\’ used as the end-of-table symbol
        
.text
MAIN:
	
GET_USER_INPUT:
	jal getline		# function call to getline. After funciton call, $a0 holds the address of the input buffer that has the inputed string
	sub $sp, $sp, 8		# create space on the stack to store the address of the input_buffer
	sw $a0, 0($sp)		# copy the input buffer address to the stack
	
	jal PROCESS_TYPES	# call PROCESS_TYPES which populates the type buffer with each character in the input buffer's char codes
	jal PRINT_TYPES
	
	j GET_USER_INPUT


##########################
# input:	No input
# output: No output
# modified: $a0 -> holds the address of the input buffer which has the input line stored in it
##########################

getline:
        la $a0, PROMPT		# Prompt to enter a new line
        li $v0, 4 		# Command code to write to the screen
        syscall        		
        la $a0, IN_BUFFER	# Store the user input in IN_BUFFER
        li $a1, 80		# IN_BUFFER has space for 80 character
        li $v0, 8		# Command code to read a new line
        syscall
        jr $ra			# Return
        
##########################
# input: $a0 -> address of the input buffer
# output: No output
# modified: TYPE_BUFFER -> holds the characters from the input buffer but in their integer form according to the CHAR_TABLE
##########################

PROCESS_TYPES:
	sub $sp, $sp, 8		# create space to store return address
	sw $ra, 0($sp)		# store return address on the stack
	la $t1, TYPE_BUFFER	# store address of TYPE_BUFFER in $t1
PRC_T_LOOP:
	lb $t0, ($a0)		# t0 = *a0;
	beq $t0, 0x23, PRC_T_DONE	# if current element is equal to # branch to DONE
	
	sub $sp, $sp, 8		# create space on the stack to store the address of the current element in the input buffer
	sw $a0, 0($sp)		# store the address of the current element in the input buffer
	
	sub $sp, $sp, 8		# create space on the stack to store the address of the current position in the type buffer
	sw $t1, 0($sp)		# store the address of the current position in the type buffer
	
	move $a0, $t0		# copy value of the current element in the input buffer to the argument register $a0
	jal GET_CHAR_CODE	# call GET_CHAR_CODE which returns the int code for the current char in the input buffer according to the char table
	lw $t1, 0($sp)		# retrieve address of current position in the type buffer from the stack
	add $sp, $sp, 8		# free up space on the stack
	lw $a0, 0($sp)		# retrieve address of current element in the input buffer from the stack
	add $sp, $sp, 8		# free up space on the stack
	sb $v0, 0($t1)		# store the returned char code in the type buffer
	
	add $a0, $a0, 1		# go to the next address in the input buffer
	add $t1, $t1, 1		# go to the next address in the type buffer
	j PRC_T_LOOP
       
PRC_T_DONE:
	li $t2, 5		# hold the char code for #
	sb $t2, 0($t1)		# represent the last char in the input buffer with 5 in the type buffer
	lw $ra, 0($sp)		# retrieve previously stored return address
	add $sp, $sp, 8		# free the stack
	jr $ra
       

##########################
# input: $a0 -> char from the input buffer
# output: $v0 -> char code associated with char according to the char table
# modified: none
##########################

GET_CHAR_CODE:
	la $t0, CHAR_TABLE
GCC_LOOP:
	lw $t1, 0($t0)			# t1 = *t0;
	beq $t1, 0x5c, NOT_FOUND	# if  $t1 == 0x5c, char code not found, go to NOT_FOUND
	
	beq $t1, $a0, FOUND		# if $t1 == $a0, char found in char table, go to FOUND
	
	add $t0, $t0, 8			# go to the next element char-code pair in CHAR_TABLE
	j GCC_LOOP

NOT_FOUND:
	li $v0, 0			# char $a0 not found in CHAR_TABLE, return 0
	j GCC_DONE

FOUND:
	lw $v0, 4($t0)			# char $a0 found in CHAR_TABLE, return the char code at next address

GCC_DONE:
	jr $ra
	
##########################
# input: TYPE_BUFFER
# output: none
# modified: none 
##########################
	
PRINT_TYPES:
	la $t0, TYPE_BUFFER		# store TYPE_BUFFER address in $t0
PR_T_LOOP:
	lb $t1, 0($t0)			# t1 = *t0;
	beq $t1, 5, PR_T_DONE		# if current element in the TYPE_BUFFER is 5 i.e #, you have hit the end of the buffer, go to DONE
	
	li $v0, 1			# syscall to print integers 
	move $a0, $t1			# a0 = t1
	syscall
	
	add $t0, $t0, 1
	j PR_T_LOOP

PR_T_DONE:
	li $a0, 5			# print 5 for the # character
	li $v0, 1
	syscall
	
	li $a0, '\n'			# print new line
	li $v0, 11
	syscall
	jr $ra
	
	
	


       
