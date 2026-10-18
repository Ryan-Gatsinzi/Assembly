###############################################################################
# TITLE: 	HWK #5
# AUTHOR: 	
# DATE: 	
# DESCRIPTION:	 
###############################################################################

.data 
	IN_BUFFER: 	.space 80
	TYPE_BUFFER:	.space 80
	TAB_TOKEN:	.space 240 	# 20 entries of 3 words each = 20 * 3 * 4 = 240

	PROMPT:		.asciiz "Enter a new input line. \n"
	CHAR_TABLE:	.word 0x09, 6 # tab
			.word 0x0a, 6 # line feed
			.word 0x0d, 6 # carraige return
			.word ' ', 6
			.word '#', 5
			.word '$', 4
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
			.word 0x5c, -1 # '\' used as the end-of-table symbol

	PARSE_STATE_TABLE:
		Q0: 	.word FSA_ACT_1
			.word Q1  # T1
			.word Q1  # T2
			.word Q1  # T3
			.word Q1  # T4
			.word Q1  # T5
			.word Q1  # T6
			.word Q11 # T7
			
		Q1: 	.word FSA_ACT_2
			.word Q2  # T1
			.word Q5  # T2
			.word Q3  # T3
			.word Q3  # T4
			.word Q4  # T5
			.word Q0  # T6
			.word Q11 # T7

		Q2: 	.word FSA_ACT_1
			.word Q6  # T1
			.word Q7  # T2
			.word Q7  # T3
			.word Q7  # T4
			.word Q7  # T5
			.word Q7  # T6
			.word Q11 # T7

		Q3: 	.word FSA_ACT_4
			.word Q0  # T1
			.word Q0  # T2
			.word Q0  # T3
			.word Q0  # T4
			.word Q0  # T5
			.word Q0  # T6
			.word Q11 # T7

		Q4: 	.word FSA_ACT_4
			.word Q10 # T1
			.word Q10 # T2
			.word Q10 # T3
			.word Q10 # T4
			.word Q10 # T5
			.word Q10 # T6
			.word Q11 # T7

		Q5: 	.word FSA_ACT_1
			.word Q8  # T1
			.word Q8  # T2
			.word Q9  # T3
			.word Q9  # T4
			.word Q9  # T5
			.word Q9  # T6
			.word Q11 # T7

		Q6: 	.word FSA_ACT_3
			.word Q2  # T1
			.word Q2  # T2
			.word Q2  # T3
			.word Q2  # T4
			.word Q2  # T5
			.word Q2  # T6
			.word Q11 # T7

		Q7: 	.word FSA_ACT_4
			.word Q1  # T1
			.word Q1  # T2
			.word Q1  # T3
			.word Q1  # T4
			.word Q1  # T5
			.word Q1  # T6
			.word Q11 # T7

		Q8: 	.word FSA_ACT_3
			.word Q5  # T1
			.word Q5  # T2
			.word Q5  # T3
			.word Q5  # T4
			.word Q5  # T5
			.word Q5  # T6
			.word Q11 # T7

		Q9: 	.word FSA_ACT_4
			.word Q1  # T1
			.word Q1  # T2
			.word Q1  # T3
			.word Q1  # T4
			.word Q1  # T5
			.word Q1  # T6
			.word Q11 # T7

		Q10: 	.word FSA_ACT_RETURN
			.word Q10 # T1
			.word Q10 # T2
			.word Q10 # T3
			.word Q10 # T4
			.word Q10 # T5
			.word Q10 # T6
			.word Q11 # T7

		Q11: 	.word FSA_ACT_ERROR
			.word Q4 # T1
			.word Q4 # T2
			.word Q4 # T3
			.word Q4 # T4
			.word Q4 # T5
			.word Q4 # T6
			.word Q4 # T7 	
	TOKEN_HEADER:   .ascii  "      Token               Token Type  \n"	# 6 spaces before 'token', 
			.asciiz "-----------------     ----------------\n"	# 31 spaces until gap between 'Token' and 'Type'
	NEWLINE:	.asciiz "\n"
				
.text
MAIN:	
	# 1
	jal GET_USER_INPUT		# GET_USER_INPUT();

	# 2
	la $a0, IN_BUFFER		# store address of the INPUT_BUFFER in $a0 as an input for PROCESS_INPUT
	jal PROCESS_INPUT		# PROCESS_INPUT();
	
	# 3
	jal PRINT_TYPES			# PRINT_TYPES();

	# 4 
	jal PROCESS_TOKENS		# PROCESS_TOKENS();
	
	# 5
	jal PRINT_TOKENS		# PRINT_TOKENS();

	# LOOP
	j MAIN
	
	# 4 (NOT REACHED)
	jal EXIT_PROGRAM		# EXIT_PROGRAM();

###############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure. fyi, pv is an alias for a pointer to the parse_variable struct
# OUTPUT:	NA
# MODIFIED:	pv->state, pv->cur_char, pv->cur_type, pv->cur_indexs
###############################################################################
FSA_ACT_1:
	lw $t0, 4($a0)			# store pv->char_index in $t0
	lb $t1, IN_BUFFER($t0)        # $t1 holds the $t0'th character in the input buffer
	sw $t1, 8($a0)			# store the $t0'th character from the input buffer in the parse_variable struct i.e pv->cur_char = IN_BUFFER[pv->char_index];
	lb $t2,	TYPE_BUFFER($t0)     # $t2 holds the $t0'th integer in the type buffer
	sw $t2, 12($a0)		# store the $t0'th integer code from the type buffer in the parse_variable struct i.e pv->cur_type = TYPE_BUFFER[pv->char_index];
	add $t0, $t0, 1
	sw $t0, 4($a0)			# pv->char_index += 1;
	jr $ra

###############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure
# OUTPUT:	NA
# MODIFIED:	$a0->token_space, TAB_TOKEN[pv->tt_index].text[0]
###############################################################################
FSA_ACT_2:
	lw $t0, 16($a0)			# $t0 holds tt_index
	mul $t0, $t0, 12		# set $t0 to multiples of 12 because each token in tab_token takes up 12 bytes
	la $t1, TAB_TOKEN($t0)	# $t1 holds the $t0'th token
	lw $t2, 8($a0)			# t2 holds pv->cur_char
	sw $t2, 0($t1)			# store the pv->cur_char from the parse_variabel struct into the 0'th position of the text attribute of the token
	li $t3, 7
	sw $t3, 20($a0)		# pv->token_space = 7;
	jr $ra

###############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure
# OUTPUT:	NA
# MODIFIED:	TAB_TOKEN.text, $a0->token_space 
###############################################################################
FSA_ACT_3:
	lw $t0, 20($a0)		# $t0 holds token_space
	li $t5, 8			# t5 will store the max length of token.text
	sub $t1, $t5, $t0			# $t1 holds the offste i.e $t1 = 8 - pv->token_space;
	lw $t2, 16($a0)			# $t2 holds tt_index
	mul $t2, $t2, 12		# mutl    itple $t2 by 12 because each entry in tab_token takes up 12 bytes
	la $t3, TAB_TOKEN($t2)	# $t3 = TAB_TOKEN[pv->tt_index]
	lw $t4, 8($a0)			# $t4 = pv->cur_char
	add $t3, $t3, $t1		# pointer aritmetic to get the address of the token->text char at offset index
	sb $t4, 0($t3)			# TAB_TOKEN[pv->tt_index].text[offset] = pv->cur_char;
	
	sub $t0, $t0, 1			#pv->token_space -= 1;
	sw $t0, 20($a0)
			
	jr $ra
	
###############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure.
# OUTPUT:	NA
# MODIFIED:	TAB_TOKEN.type, $a0->token_space
###############################################################################
FSA_ACT_4:
	lw $t0, 0($a0)			# $t0 holds pv->state
	la $t6, Q4
	beq $t0, $t6 STATE_IS_Q4	# if state == Q4 branch to STATE_IS_Q4
	la $t6, Q7
	beq $t0, $t6, STATE_IS_Q7	# if state == Q7 branch to STATE_IS_Q7
	la $t6, Q9
	beq $t0, $t6, STATE_IS_Q9	# if state == Q9 branch to STATE_IS_Q9
	#else
	lw $t1, 12($a0)			# token_type $t1 holds pv->curr_type
	j ACT_4_DONE
	
	STATE_IS_Q4:
		li $t1, 5		# token_type = 5;
		j ACT_4_DONE
	STATE_IS_Q7:
		li $t1, 1		# token_type = 1;
		j ACT_4_DONE
	STATE_IS_Q9:
		li $t1, 2		# token_type = 2;	
	
	ACT_4_DONE:
		lw $t2, 16($a0)			# $t2 = pv->tt_index
		mul $t3, $t2, 12		# set $t2 to multiples of 12 because each token in tab_token takes up 12 bytes
		la $t4, TAB_TOKEN($t3)	# $t3 holds the address of the $t2'nd token in TAB_TOKEN
		add $t4, $t4, 8			# add 8 bytes to the address of the token in order to jump the text and access the type attribute
		sw $t1, 0($t4)			# store the token_type in TAB_TOKEN[pv->tt_index].type
		add $t2, $t2, 1			# indrement tt_index
		sw $t2, 16($a0)		# pv->tt_index = pv->tt_index + 1;
		li $t5, 8			# load 8 into $t5
		sw $t5, 20($a0)		# pv->token_space = 8;
		jr $ra
		
###############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure
# OUTPUT:	$v0 set 0
# MODIFIED:	
###############################################################################
FSA_ACT_RETURN:
	li $v0, 0
	jr $ra
##############################################################################
# INPUT: 	$a0 holds pointer to parse_variables structure
# OUTPUT:	$v0 set 1
# MODIFIED:	
###############################################################################
FSA_ACT_ERROR:
	li $v0, 1
	jr $ra
###############################################################################
# INPUT: 	NA
# OUTPUT:	NA
# MODIFIED:	
###############################################################################
CLEAR_TAB_TOKEN:
	li $t0, 0				# initialize iterator with 0
	li $t1, 0				# value i'm going to load into each space in tab_token
	CLEAR_LOOP:
		beq $t0, 240, DONE_CLEAR
		sb $t1, TAB_TOKEN($t0)	# set value at the $t0'th index to $t1 = 0
		add $t0, $t0, 1			# increment iterator
		j CLEAR_LOOP
	DONE_CLEAR:
		jr $ra
		
###############################################################################
# INPUT: 	NA
# OUTPUT:	$v0 holds 0 if everything is OK, 1 otherwise
# MODIFIED:	parse_varaibles struct 
###############################################################################
PROCESS_TOKENS:
	sub $sp, $sp, 4		# allocate space on the stack to store the return address
	sw $ra, ($sp)		# store the return address on the stack
	
	jal CLEAR_TAB_TOKEN	# clear TAB_TOKEN before instatiating new token object
	
	# create parse_variables struct
	sub $sp, $sp, 24 	# create space on the stack for the parse_variable struct i.e 24 bytes for 6 integer attributes
	la $t0, Q0		# store the address of Q0 in $t0 
	li $t1, 0		# store 0 in $t1 which will be store in all the other attributes of the stack
	sw $t0, ($sp)		# store the address of Q0 in the first attribute of the stack i.e state = Q0
	sw $t1, 4($sp)		# char_index = 0
	sw $t1, 8($sp)		# cur_char = 0
	sw $t1, 12($sp)		# cur_type = 0
	sw $t1, 16($sp)		# tt_index = 0
	sw $t1, 20($sp)		# token_space = 0
	
	lw $t2, ($t0)		# $t2 holds address of the function to jump
	move $a0, $sp		# copy address of parse_variable struct into the argument register $a0 to send to a function
	li $v0, -1
	STATE_CHANGE_LOOP:
		bgt $v0, -1, PROCESS_DONE	# if $v0 greater that -1 i.e $v0 = 0 or 1 then branch to PROCESS_DONE
		jalr $t2			# jump to the function whose address is stored in $t2	
		lw $t3, ($a0)		# dereference $a0 and store address of current state e.g Q1 or Q2 or Q3 etc... in $t3		
		lw $t4, 12($a0)		# $t4 holds the curr_type 
		mul $t4, $t4, 4		# set $t4 to multiple of 4 because each word in PARSE_STATE_TABLE is 4 bytes large
		add $t3, $t4, $t3
		lw $t5, 0($t3)		# $t5 holds the next state to switch to based on the current state and cur_type
		sw $t5, 0($a0)		# update state in parse_variables
		lw $t2, 0($t5)		# derefence $t5 to get address of function associated with state in $t5 and store that in $t2
		j STATE_CHANGE_LOOP
	
PROCESS_DONE:	
	add $sp, $sp, 24		# deallocate 24 bytes for the parse_variable struct from the struct. i.e free the stack
	lw $ra, ($sp)			# get the return address
	add $sp, $sp, 4			# free the stack
	jr $ra
				
###############################################################################
# INPUT: $a0 -> address of the input buffer
# OUTPUT: No output
# MODIFIED: TYPE_BUFFER -> holds the characters from the input buffer but in their integer form according to the CHAR_TABLE
###############################################################################
PROCESS_INPUT:
	sub $sp, $sp, 8		# create space to store return address
	sw $ra, 0($sp)		# store return address on the stack
	la $t1, TYPE_BUFFER	# store address of TYPE_BUFFER in $t1
PRC_IN_LOOP:
	lb $t0, ($a0)		# t0 = *a0;
	beq $t0, 0x23, PRC_IN_DONE	# if current element is equal to # branch to DONE
	
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
	j PRC_IN_LOOP
       
PRC_IN_DONE:
	li $t2, 5		# hold the char code for #
	sb $t2, 0($t1)		# represent the last char in the input buffer with 5 in the type buffer
	lw $ra, 0($sp)		# retrieve previously stored return address
	add $sp, $sp, 8		# free the stack
	jr $ra
       



###############################################################################
# INPUT: $a0 -> char from the input buffer
# OUTPUT: $v0 -> char code associated with char according to the char table
# MODIFIED: none
###############################################################################
GET_CHAR_CODE:
	la $t0, CHAR_TABLE
GCC_LOOP:
	lw $t1, 0($t0)			# t1 = *t0;
	beq $t1, 0x5c, NOT_FOUND	# if  $t1 == 0x5c, char code not found, go to NOT_FOUND
	
	beq $t1, $a0, FOUND		# if $t1 == $a0, char found in char table, go to FOUND
	
	add $t0, $t0, 8			# go to the next element char-code pair in CHAR_TABLE
	j GCC_LOOP

NOT_FOUND:
	li $v0, 7			# char $a0 not found in CHAR_TABLE, return 7
	j GCC_DONE

FOUND:
	lw $v0, 4($t0)			# char $a0 found in CHAR_TABLE, return the char code at next address

GCC_DONE:
	jr $ra


###############################################################################
# INPUT: 	NA
# OUTPUT:	NA
# MODIFIED:	$t0, $t1, $t2, $t3, $t4, $t5
###############################################################################
PRINT_TOKENS:
	
	la $a0, TOKEN_HEADER
	li $v0, 4
	syscall				# printf("%s", TOKEN_HEADER);
	
	li $t0, 0			# int tt_index = 0;
_PRINT_TOKENS_LOOP:

	li $t1, 0			# int chars_printed = 0;
	mul $t2, $t0, 12
	lb $t3, TAB_TOKEN($t2)		
	beq $t3, 0, _PRINT_TOKENS_DONE	# while (tab_token[0] != 0) {


	_PRINT_TOKENS_LSPACE:
	bge $t1, 6, _PRINT_SINGLE_TOKEN	# 	while (chars_printed < 5) {
	la $a0, ' '
	li $v0, 11
	syscall				# 		printf(" ");
	add $t1, $t1, 1			# 		chars_printed += 1;
	j _PRINT_TOKENS_LSPACE		# 	}
	
	
	_PRINT_SINGLE_TOKEN:
	li $t4, 0			# 	int token_chars_printed = 0;
	_PRINT_SINGLE_LOOP:
	bge $t4, 8, _PRINT_TYPE_LSPACE	# 	while (chars_printed < 8) {
	add $t5, $t2, $t4		
	lb $a0, TAB_TOKEN($t5)
	beq $a0, 0, _PRINT_TYPE_LSPACE	# 		if (tab_token[tt_index + token_chars_printed] == 0) break;
	li $v0, 11
	syscall				# 		printf("%c", tab_token[token_chars_printed]);
	add $t4, $t4, 1			# 		token_chars_printed += 1;
	add $t1, $t1, 1			# 		chars_printed += 1;
	j _PRINT_SINGLE_LOOP		# 	}

				
	_PRINT_TYPE_LSPACE:
	bge $t1, 31, _PRINT_TYPE	# 	while (chars_printed < 31) {
	la $a0, ' '
	li $v0, 11
	syscall				# 		printf(" ");
	add $t1, $t1, 1			# 		chars_printed += 1;
	j _PRINT_TYPE_LSPACE		# 	}
	
	
	_PRINT_TYPE:
	add $t2, $t2, 8	
	lw $a0, TAB_TOKEN($t2)		
	li $v0, 1
	syscall				# 	printf("%d", tab_token[8,9,10,11]);
	la $a0, NEWLINE
	li $v0, 4
	syscall				# 	printf("\n");
	
	
	add $t0, $t0, 1			# 	tt_index += 1;
	j _PRINT_TOKENS_LOOP		# }
	

_PRINT_TOKENS_DONE:
	jr $ra


###############################################################################
# INPUT: 	NA
# OUTPUT:	NA
# MODIFIED:	$t0, $t1
###############################################################################
PRINT_TYPES:
	li $t0, 0			# i = 0;

_PRINT_CT_LOOP:
	lb $t1, TYPE_BUFFER($t0)		# OUTPUT[i]
	beq $t1, 6, _PRINT_CT_ONE_SPACE
_PRINT_CT_ONE_NUM:
	li $v0, 1
	move $a0, $t1			
	syscall				# Print a single NUMBER
	j _PRINT_CT_POST_NUM_OR_SPACE
_PRINT_CT_ONE_SPACE:
	li $v0, 11
	li $a0, 32			# Print a ' ' character
	syscall
_PRINT_CT_POST_NUM_OR_SPACE:																
	add $t0, $t0, 1			# i += 1
	bne $t1, 5, _PRINT_CT_LOOP	# if (OUTPUT[i] != '#') GOTO LOOP 	

_PRINT_CT_LOOP_DONE:
	li $v0, 11
	li $a0, 10			# Print a '\n' character
	syscall

	jr $ra				# return



###############################################################################
# INPUT: 	NA
# OUTPUT: 	NA
# MODIFIED: 	$v0, $a0, $a1
###############################################################################
GET_USER_INPUT:
	li $v0, 4			# PRINT PROMPT
	la $a0, PROMPT	
	syscall
	
	li $v0, 8			# FGETS
	la $a0, IN_BUFFER
	li $a1, 80	
	syscall
	
	jr $ra	
		

###############################################################################
# INPUT: 	NA
# OUTPUT: 	NA
# MODIFIED: 	$v0
###############################################################################
EXIT_PROGRAM:
	li $v0, 10			# HALT
	syscall	
	jr $ra
		
