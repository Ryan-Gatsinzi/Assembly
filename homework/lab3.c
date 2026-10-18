#include <stdio.h>
int x = 10;
int A[] = {9,4,5,2,5,2,3,7,1,12};

void select_sort(int N){
  int i, j, min, max, tmp;
  int t0 = N/2;   // temporary variable
  i = 0;

  LOOP:
  if(i > t0) goto EXIT0;  
  
  min = i;
  max = i;
  
  int t1 = N - i;
  j = i + 1;

  INNER_LOOP:
  
    if(j >= t1) goto EXIT1;
    
    if(A[j] > A[max]) max = j;  //set max index to j if current value at index j is greater than the index at max index
    if(A[j] < A[min]) min = j;  //set min index to j if current value at index j is less than the index at min index
    
    j = j+1;    // step
      goto INNER_LOOP;

    EXIT1:    // outside the inner loop

      // Carry out swap

      tmp = A[i];
      A[i] = A[min];
      A[min] = tmp;

      t0 = N-1;
      t0 = t0 - i;

      tmp = A[t0];
      A[t0] = A[max];
      A[max] = tmp;

    i = i+1;
    goto LOOP;

  EXIT0:  // exit loop, function terminates
}

int main(){
  select_sort(x);
  for(int i = 0; i < x; i++)
    printf("%d, ", A[i]);
  
}



