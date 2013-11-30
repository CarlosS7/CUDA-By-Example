#include <iostream>

// __global__ alerts the compiler that a function should be built to run on a device, not the host
__global__ void kernel(void)
{
}

// This function is built for the host as normal
int main(void)
{
	kernel<<<1,1>>>();	// The angled brackets denote arguments to be passed to the device runtime
	printf("Hello, world!\n");
	return 0;
}