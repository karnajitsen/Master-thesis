#include<iostream>
#include<algorithm>
#include<stdio.h>
#include<fstream>
#include <stdlib.h>
using namespace std;
#define REPEAT 1
#define Real double
#define STRIDE 1
#define CACHELINE 8
__global__ void VecAdd(Real* A, int* N, Real* d_time);


int main(int argc, char* argv[])
{
   if(argc != 2)
   {
     std::cout << "Wrong number of argument!! Exiting program !!!";
     return 0;
   }
      
  // struct timeval tv1, tv2;
   int N = atoi(argv[1]);
   //register long elapsed=0;
   Real *A, *d_A;
   int *d_N;// *B, *C, *d_A, *d_B, *d_C ;           
   std::ofstream fp;
   fp.open("/home/hpc/ihpc/ihpc002h/gpu-exp/Master-thesis/data/result.txt", std::ofstream::app);
    double *d_time, h_time;
    A  = (Real*)malloc(N*sizeof(Real)); 
   // B  = (Real*)malloc(N*sizeof(Real)); 
   // C  = (Real*)malloc(N*sizeof(Real));
    
    
    cudaMalloc(&d_A, N*sizeof(Real));
    cudaMalloc(&d_time, sizeof(double));
    cudaMalloc(&d_N, sizeof(double));
   // cudaMalloc(&d_B, N*sizeof(Real));
   // cudaMalloc(&d_C, N*sizeof(Real));
    
    
    for(int i=0; i < N ; i++)
    {
      A[i] = (i+STRIDE)%N;
     // B[i] = rand()%5;
      //C[i] = 0.0;
    }
    
    cudaMemcpy(d_A, A, N*sizeof(Real), cudaMemcpyHostToDevice );
    cudaMemcpy(d_N, &N, sizeof(int), cudaMemcpyHostToDevice );
    //cudaMemcpy(d_C, C, N*sizeof(Real), cudaMemcpyHostToDevice );
    
    //for(int i=0 ; i < REPEAT ; i++)
    //{
    //gettimeofday(&tv1, NULL);                  
    VecAdd<<<1, 1>>>(d_A, d_N, d_time);
    //gettimeofday(&tv2, NULL);
    //elapsed += ((tv2.tv_sec-tv1.tv_sec)*1000000.0 + (tv2.tv_usec-tv1.tv_usec));
    //}
    
    cudaMemcpy(&h_time, d_time, sizeof(double), cudaMemcpyDeviceToHost);
    cudaDeviceSynchronize();
   //cout << N << std::endl;
    
    //double td = (N * 8.0)/1024;
    //cout << h_time << " " << CLOCKS_PER_SEC << std::endl;
    
    fp << N*8.0/1024.0 << " " << h_time << std::endl;
    
    for(int i =0; i < N ; i++)
    {
     // cout << A[i] << std::endl;
    }
     //fs << std::endl;
   
    cudaFree(d_A);
    //cudaFree(d_B);
    //cudaFree(d_C);
    fp.close();
}
