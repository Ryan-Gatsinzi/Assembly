#include <stdio.h>
#include <math.h>
int test2(int x, int y){
  int val = 4*x;
  if (y > 0) {
    if (x < y) {
      val = x-y;
    } else {
      val = x^y;
    }
  } else {
    if (y < -2) {
      val = x+y;
    }
  }
  return val;
}

int test(int x, int y){
    int val = 4*x;

    if(y <= 0) goto OUTER_ELSE;

    OUTER_TRUE:
        if(x >= y) goto INNER_ELSE;
        val = x-y;
        goto DONE;
        
    INNER_ELSE:
        val = x^y;
        goto DONE;

    OUTER_ELSE:
        if (y >= -2) goto DONE;
        val = x + y;
    
    DONE:

    return val;
}
int N = 10;
int A[] = {1,2,3,4,5,6,7,8,9,10};
int B[] = {1,2,3,4,5,6,7,8,9,10};

int bin_search1(int key) {
  int found = 0;
  int j = -1;
  int min = 0;
  int max = N-1;
  while (found == 0) {
    if (min > max) {
      break;
    } else {
      j=floor((min+max)/2);
      if (key == B[j]) {
        found = 1;
      } else {
      if (key < B[j]) {
        max = j - 1;
      } else {
        min = j + 1;
      }
    }
  }
  return j;
}
}


int bin_search(int key){
    int found = 0;
    int j = -1;
    int min = 0;
    int max = N-1;
    
    LOOP:
        if(found != 0) goto DONE;
        if(min > max) goto DONE;
        
        int T = min+max;
        T = T/2;
        T = floor(T);

        if(key != A[T]) goto ELSE;

        found = 1;
        j = T;
        goto LOOP;

        ELSE:
            if(key > A[T]) goto SHIFT_RIGHT;
            max = T - 1;
            goto LOOP;

        SHIFT_RIGHT:
            min = T + 1;
            goto LOOP;



    DONE:

    return j;
}
int main(int charc, char* argv[]){
    printf("%d\n", bin_search1(8));
    printf("%d", bin_search(8));
    return 0;

}