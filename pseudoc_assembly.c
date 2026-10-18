/*
Rules for pseudo c assembly

1.No complex statments 
2.No more:
    IF/ELSE, do-while, for, switch cases, while loops

3. Only use r0, r1, r2, r3 .... r15;
LT, GT, LTE, GTE, EQ, NEQ

for conditional jumps use:
    comp()
    if(else) got
*/

#include <stdio.h>

int r0, r1, r2, r3, r4, r5, r6; // declare registers

int LT, GT, LTE, GTE, EQ, NEQ; // declare flags

void comp(int a, int b) {
    LT = a < b;
    GT = a > b;
    LTE = a <= b;
    GTE = a >= b;
    EQ = a == b;
    NEQ = a != b;
}

int main(int argc, char* argv[]){
    r0 = 0; // intialize r0 with 0; r0 is the iterator
    int arr[] = {1,2,3,4,5,6};

    LOOP:
        comp(r0, 6); // compare the iterator r0 and 6(size of array)
        if(GTE) // if r0 >= 6
            goto DONE;

        r1 = arr[r0]; // initialize r1 with the r0th element
        r1 = r1 % 2; //assign the result of the r1 element % 2 to r1
        comp(r1, 0); // compare r1 and 0

        if(NEQ) // if r1 != 0 i.e r1 is odd
            goto ELSE;
        
        printf("EVEN!\n"); goto UPDATE;

    ELSE:
        printf("ODD!\n");

    UPDATE:
        r0 = r0 + 1; // increment the iterator r0
        goto LOOP;
    
    DONE:
    
    return 0; 
}

