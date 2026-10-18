.data

.text
MAIN:
    li $v0, 5
    syscall        # scanf("%d", &n);
    move $t0, $v0    # int n = ^^^;
    
    move $a0, $t0
    sub $sp, $sp, 4
    sw $t0, ($sp)    # PUSH($t0), store integer read on the stack pointer
    
    jal FACTORIAL    # int f = factorial(n);
    lw $t0, ($sp)	# read $t0 from the stack
    add $sp, $sp, 4    # POP($t0) ; free up stack space
    
    move $t1, $v0    # int f ^^^
    
    
    move $a0, $t1
    li $v0, 1
    syscall        # printf("%d", f);

    li $v0, 10 
    syscall        # exit(0);
    
#####################
# input: $a0 as 'n'
# output: $v0 as 'rv'
# affected: NA
#####################
FACTORIAL:            # int factorial(int n) {
    bne $a0, 1, F_ELSE    #     if (n == 1) {
    li $v0, 1
    jr $ra        #        return 1;
            #    }
F_ELSE:                #
    sub $sp, $sp, 4
    sw $ra, ($sp)    # PUSH($ra)
    sub $sp, $sp, 4
    sw $a0, ($sp)    # PUSH($a0)
    sub $a0, $a0, 1    
    jal FACTORIAL    #    int t=factorial(n-1);
    lw $a0, ($sp)
    add $sp, $sp, 4    # POP($a0)
    lw $ra, ($sp)
    add $sp, $sp, 4    # POP($ra)
    mul $v0, $a0, $v0
    jr $ra        #    return n * t;
            # }