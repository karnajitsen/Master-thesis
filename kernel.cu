#include<time.h>
#include<stdio.h>
#define Real double
using namespace std;

__global__ void VecAdd(Real* A, int* N, Real* d_time)
{
   // int i = threadIdx.x, j;
    //j=A[i];
   int j = 0;
   clock_t start_t, end_t;
  // struct timeval tv1, tv2;
   start_t = clock();
   //printf("\n%d \n", clock());
   //gettimeofday(&tv1, NULL); 
   for (int it=0; it < *N; it++)   
   {
      
      j=A[j];
      
   }
   
   for (int it=0; it < *N; it++)   
   {
      
      j=A[j];
      
   }
   
   for (int it=0; it < *N; it++)   
   {
      
      j=A[j];
      
   }
   
   
    //gettimeofday(&tv2, NULL);
   //*d_time = ((tv2.tv_sec-tv1.tv_sec)*1000000.0 + (tv2.tv_usec-tv1.tv_usec));
     
   end_t = clock();
   *d_time = (double)(end_t - start_t) ; 
   //printf("\n%d %d %f \n", start_t, end_t, *d_time);
   
   
}