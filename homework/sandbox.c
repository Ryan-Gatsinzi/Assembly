#include <stdio.h>
enum toppings{
    JALAPENOS = 1,
    PICKLES = 2,
    BACON = 4,
    LETTUCE = 8,
    TOMATO = 16
};

void print_order(int t){

}

int main(){
    int order = JALAPENOS | PICKLES | LETTUCE;
    int jake = order & (~JALAPENOS);
    int son = ~order;


    int a = 101;
    int b = 17;

    a = a+b;
    b = a-b;
    a = a-b;

    printf("a = %d, b = %d", a, b);
    return 0;
}

/*
*a = *a^*b;

*/