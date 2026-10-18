N1:    .word 3
    .word N2
N2:    .word 7
    .word N3
N3:    .word 9
    .word 0

.text
MAIN:
    la $a0, N1
    jal PRINT_BW
    #jal LIST_TOTAL    # int t = list_total(N1);

    li $v0, 10
    syscall        # exit(0);
    
    
####################
# Input: $a0 as 'n'
# Output: NA
# Modified: TBD
####################
PRINT_BW:            # void print_bw(Node* n) {
            #//     if (n == NULL) {
            #//       return;
            #//    }
    lw $t0, 4($a0)
    beq $t0, $zero, PE    #    if (n->next != NULL)
            #    {
    sub $sp, $sp, 4
    sw $ra, ($sp)    # PUSH($ra)
    sub $sp, $sp, 4
    sw $a0, ($sp)    # PUSH($a0)
    move $a0, $t0
    jal PRINT_BW    #      print_bw(n->next);
    lw $a0, ($sp)    #    }
    add $sp, $sp, 4    # POP($a0)
    lw $ra, ($sp)
    add $sp, $sp, 4    # POP($ra)
PE:
    li $v0, 1
    lw $a0, ($a0)
    syscall        #    printf("%d",n->val);            
    jr $ra        # }    
    
    
    
    
#############################
# Input: $a0 as 'n'
# Output: $v0 as 'total'
# Modified: TBD
#############################
LIST_TOTAL:        # int list_total(Node* n) {
    li $t0, 0        #     int t = 0;
LT_L:
    beq $a0, $zero, LT_D    #     while (n != NULL) {
    lw $t1, 0($a0)    #        int v = n->v;
    add $t0, $t0, $t1    #        t += v;
    lw $a0, 4($a0)    #        n = n->next;
    j LT_L        #     }
LT_D:
    move $v0, $t0
    jr $ra        #    return t;