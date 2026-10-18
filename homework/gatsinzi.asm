#Filename: gatsinzi.asm
#author: Udatinya Ryan Gatsinzi
#Desc: This program prints My name is Ryan

.text
main:
	li $v0, 4 # loads the immediate value 4 (syscall for printing a string) in to the cpu register $v0 ($v0 is like a function selector)
	la $a0, message #loads the data address in message into $a0
	syscall   #execute the syscall function that was put in the $v0 cpu register (in this case it's to print the string whose address is in $a0)
	
	li $v0, 10 # loads the immediate value 10 (syscall for halting the program) in to the cpu register $v0
	syscall  #execute the syscall function that was put in the $v0 cpu register (in this case it's to halt the program)
	
.data
message:
	.asciiz "My name is Ryan"