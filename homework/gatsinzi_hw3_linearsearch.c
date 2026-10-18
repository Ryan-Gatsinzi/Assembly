#include <stdio.h>


int reg0[] = {1,2,3,4,5,6,7,8,9,10,0};
int reg1, reg2, reg3, reg4, reg5, reg6; // reg4 is the key with dummy data 10
int LT, GT, LTE, GTE, EQ, NEQ;

void comp(int a, int b){
    LT = a < b;
    GT = a > b;
    LTE = a <= b;
    GTE = a >= b;
    EQ = a == b;
    NEQ = a != b;
}

int search(){
    reg1 = 0;                           // int i = 0; 
    reg2 = 0;                           // int found = 0; 


    LOOP: 
        comp(reg2, 0);                  // compare reg1 to 0
        if(NEQ) goto DONE;              // if (found != 0) goto done i.e element has been found, you can exit the loop;
        
        reg3 = reg0[reg1];              // reg3 = X[i]

        comp(reg3, 0);                 // compare reg3 i.e reg1'th element in reg0 array, with 0
        if(EQ) goto DONE;               // if (X[i] == 0) goto done; 

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
        return reg1; 
        goto EXIT; 

    ELSE2: 
        return -1; 
    EXIT: 
}

int main(){
    int key = 5;
    reg4 = key; // reg4 is a global variable that holds the element the search function will look for
    int index = search();
    
    printf("%d", index);
    return 0;
}