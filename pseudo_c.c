#include <stdio.h>
/*
rules for pseudo c
1.No complex statments 
2.No more:
    IF/ELSE, do-while, for, switch cases, while loops
*/
int main(int argc, char* argv[]){
    //---------------- If statments-----------
//    int x = 5;
//    int t = x % 2;

//    if(t != 0) goto ODD;

//     EVEN:
//         printf("Even!");
//         goto DONE;

//     ODD: 
//         printf("Odd!");
//         goto DONE;
//     DONE:

//     return 0;

//--------- loops --------------
//   int x = -10;
//   LOOP:
//     printf("%d\n", x);
//     x = x /2;
    
//     if(x < 0) goto LOOP;

//   return 0;

    int arr[] = {5,1,2,6};
    int i = 0;

    LOOP:
        if(i >= 4)
            goto DONE;

        int x = arr[i] % 2;
        if(x != 0)
            goto ODD;
        
        EVEN:
            printf("EVEN!\n");
            goto UPDATE;

        ODD:
            printf("ODD!\n");    
            goto UPDATE;

        UPDATE:
            i = i + 1;
            goto LOOP;

    DONE:
    return 0;
}
