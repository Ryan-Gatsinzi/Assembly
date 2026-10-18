.data

.text
MAIN:
	la $t0, SUB		# int (*fptr)
	li $a0, 3
	li $a1, 2
	jalr $t0


# input: $a0 as x $a1 as y
#output: $v0 as x-y
SUB:
	sub $v0, $a0, $a1
	jr $ra
# input: $a0 as x $a1 as y
#output: $v0 as x+y
ADD:
	add $v0, $a0, $a1
	jr $ra