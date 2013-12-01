#include "../common/book.h"
#include "cuda_runtime.h"

int main(void)
{
	cudaDeviceProp prop;	// Device properties
	int dev;				// Device ID

	HANDLE_ERROR(cudaGetDevice(&dev));
	printf("ID of current CUDA device: %d\n", dev);

	// Fill a CUDA device property structure with the values we need
	memset(&prop, 0, sizeof(cudaDeviceProp));
	prop.major = 1;
	prop.minor = 3;
	// Choose a device based on these properties
	HANDLE_ERROR(cudaChooseDevice(&dev, &prop));
	printf("ID of CUDA device closest to revision 1.3: %d\n", dev);
	HANDLE_ERROR(cudaSetDevice(dev));
}