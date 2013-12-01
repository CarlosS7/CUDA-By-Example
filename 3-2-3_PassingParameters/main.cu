#include <iostream>
#include "../common/book.h"
#include "cuda_runtime.h"

// Code to run on the GPU
__global__ void add(int a, int b, int *c)
{
	*c = a + b;
}

int main(void)
{
	int c;
	int *dev_c;

	// Allocate memory on the device
	// HANDLE_ERROR is from book's sample code
	HANDLE_ERROR(cudaMalloc((void**)&dev_c, sizeof(int)));

	add<<<1,1>>>(2, 7, dev_c);

	HANDLE_ERROR(cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost));
	printf("2 + 7 = %d\n", c);
	cudaFree(dev_c);

	return 0;
}