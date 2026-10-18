#include <stdio.h>

void mystery(int a0){
    int t0 = a0/2;
    int t1 = a0 % 2;

    if(t0 != 0) mystery(t0);

    printf("%d", t1);
}

int enigma_6(char* a0, char a1){
  int i = 0;
  while(a0[i] != '\0' && a0[i] != a1)
    i++;

  if(a0[i] != '\0' && a0[i] == a1) return 1;

  if(a0[i] == '\0')  return a0[i] == a1;
}

int enigma_a(int* a0, int* a1){
  int t0 = 0;
  int i = 0;

  while(a0[i] != -1 && a1[i] != -1){
	t0 += a0[i] - a1[i];
	i++;
  }
  return t0;
}

void vd(int a0, int a1){ 
	if(a0 < a1)
		return a0;
	
	a0 -= a1;

	return vd(a0, a1); 
}

int em(int a0, int a1){
	if(a0 < 1 || a1 < 1) return -1;

	while(a0 >= a1) a0 -= a1;

	return a0;
}


int enigma_b(int a0, int a1){
	int t0 = 0;

	while(a0 != 0 || a1 != 0){
		a0 /= 2;
		a1 /= 2;
		t0++;
	}

	return t0;
}

int main(){
	int arr[] = {1,2,3,4,5,6};
	arr[1] += arr[0];
	arr[3] = arr[2] * 2;
	arr[0] = 7;

	return 0;
}