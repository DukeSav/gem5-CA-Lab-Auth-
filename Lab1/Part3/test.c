#include <stdio.h>


int main() {
	int i;
	int j;
	int A[10];
	for (i = 0; i < 10; i++)
	{
	    A[i]=i+1;
	  }
	for (j = 1; j < 3; j++){
		for (i = 0; i < 10; i++){
			if(A[i]%3==0){
				A[i]=-A[i];
			}
			else{
				A[i]=A[i]*A[i];
			}
		}
	}
	return 0;
}
