#include <stdio.h>
#include <helper_cuda.h>

int main(int argc, char** argv )
{
    int deviceCount;
    checkCudaErrors(cudaGetDeviceCount(&deviceCount));
    printf("Device Count:", deviceCount);


    return 0;
}