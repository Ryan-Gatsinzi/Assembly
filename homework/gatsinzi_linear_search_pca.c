#include <stdio.h>


int reg0[] = {1,2,3,4,5,6,7,8,9,10};
int reg1, reg2, reg3, reg4 = 10, reg5, reg6; // reg4 is the key with dummy data 10
int LT, GT, LTE, GTE, EQ, NEQ;

void comp(int a, int b){
    LT = a < b;
    GT = a > b;
    LTE = a <= b;
    GTE = a >= b;
    EQ = a == b;
    NEQ = a != b;
}

void main1(){
    reg1 = 0;                           // int i = 0; 
    reg2 = 0;                           // int found = 0; 


    LOOP: 
        comp(reg2, 0);                  // compare reg1 to 0
        if(NEQ) goto DONE;              // if (found != 0) goto done;
        
        reg3 = reg0[reg1];              // reg3 = X[i]

        comp(reg3, -1);                 // compare reg3 i.e reg1'th element in reg0 array, with -1
        if(EQ) goto DONE;               // if (X[i] == -1) goto done; 

        comp(reg3, reg4);               // compare reg3 (current element in the array) with reg4(key we are looking for)
        if(NEQ) goto ELSE;              // if (X[i] != key) goto else; 
        reg2 = 1;                       // found = 1; 
        goto LOOP;
    ELSE: 
        reg1 = reg1 +1;                 // i++; 
        goto LOOP; 
        
        DONE: 
            comp(reg2, 0);              // compare reg2(found) and 0
            if(EQ) goto ELSE2;          // if (found == 0) goto ELSE2; 
            printf("%d", reg1); 
            goto EXIT; 
    ELSE2: 
        printf("-1"); 
    EXIT: 
}

int main(){
    main1();
    return 0;
}