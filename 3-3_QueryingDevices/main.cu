#include "../common/book.h"
#include "cuda_runtime.h"

int main(void)
{
	cudaDeviceProp prop;

	int count;
	HANDLE_ERROR(cudaGetDeviceCount(&count));	// Get number of CUDA devices

	// Loop through devices
	for (int i = 0; i < count; i++)
	{
		// Get device properties
		HANDLE_ERROR(cudaGetDeviceProperties(&prop, i));

		// Do something with the available data
		// Print general information
		printf("--- General Information for Device %d ---\n", i);
		printf("Name: %d\n", prop.name);
		printf("Compute capability: %d.%d\n", prop.major, prop.minor);
		printf("Clock rate: %d\n", prop.clockRate);
		printf("Device copy overlap: ");
		if (prop.deviceOverlap)
			printf("Enabled\n");
		else
			printf("Disabled\n");
		printf("Kernel execution timeout: ");
		if (prop.kernelExecTimeoutEnabled)
			printf("Enabled\n");
		else
			printf("Disabled\n");
		printf("\n");

		// Print memory information
		printf("--- Memory Information for Device %d ---\n", i);
		printf("Total global mem: %ld\n",	prop.totalGlobalMem);
		printf("Total const mem: %ld\n",	prop.totalConstMem);
		printf("Max mem pitch: %ld\n",		prop.memPitch);
		printf("Texture alignment: %ld\n",	prop.textureAlignment);
		printf("\n");

		printf("--- MP Information for Device %d ---\n", i);
		printf("Multiprocessor count: %d\n",	prop.multiProcessorCount);
		printf("Shared mem per mp: %ld\n",		prop.sharedMemPerBlock);
		printf("Registers per mp: %d\n",		prop.regsPerBlock);
		printf("Threads in warp: %d\n",			prop.warpSize);
		printf("Max threads per block: %d\n",	prop.maxThreadsPerBlock);
		printf("Max thread dimensions: (%d, %d, %d)\n", prop.maxThreadsDim[0],
														prop.maxThreadsDim[1],
														prop.maxThreadsDim[2]);
		printf("Max grid dimensions: (%d, %d, %d)\n",	prop.maxGridSize[0],
														prop.maxGridSize[1],
														prop.maxGridSize[2]);
		printf("\n");
	}
}