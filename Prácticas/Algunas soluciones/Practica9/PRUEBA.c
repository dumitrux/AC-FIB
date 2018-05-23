#include <stdio.h>
#ifndef N
#define N 256  /* Dimensión por defecto */
#endif
#define PT 10000

float A[N][N], B[N][N], C[N][N]; 



int main() {
  float t1, t2;
  int i, j, k;
  float x;




  // CODIGO A EVALUAR: 
  for (i=0; i<N; i++) 
    for (j=0; j<N; j++)
      for (k=0; k<N; k++) 
        C[i][j] = C[i][j] + A[i][k] * B[k][j] / 2.0;



  return 0;
}

