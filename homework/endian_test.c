#include <stdio.h>

int main(){
    int x = 0;
    int arr[] = {1,2,3,4,5,6,7,8,9,10};

    int address_difference = (arr) - (arr + 1);

    

    printf("First address - second address = %d. Therefore endianess is: %s", address_difference, (address_difference > 0 ? "little endian" : "big endian"));
    return 0;
}