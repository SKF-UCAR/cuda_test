#include <cuda_runtime.h>
#include <iostream>

int main() {
    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);

    if (error_id != cudaSuccess) {
        std::cerr << "Error: " << cudaGetErrorString(error_id) << std::endl;
        return EXIT_FAILURE;
    }

    if (deviceCount == 0) {
        std::cout << "No CUDA-capable devices detected." << std::endl;
        return EXIT_SUCCESS;
    }

    std::cout << "Number of CUDA-capable devices: " << deviceCount << std::endl;

    for (int device = 0; device < deviceCount; ++device) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, device);

        std::cout << "\nDevice " << device << ": " << deviceProp.name << std::endl;
        std::cout << "  Compute Capability: " << deviceProp.major << "." << deviceProp.minor << std::endl;
        std::cout << "  Total Global Memory: " << deviceProp.totalGlobalMem / (1024 * 1024) << " MB" << std::endl;
        std::cout << "  Multiprocessors: " << deviceProp.multiProcessorCount << std::endl;
        std::cout << "  Maximum Threads per Block: " << deviceProp.maxThreadsPerBlock << std::endl;
        std::cout << "  Maximum Threads per Multiprocessor: " << deviceProp.maxThreadsPerMultiProcessor << std::endl;
        std::cout << "  Maximum Grid Size: [" 
                  << deviceProp.maxGridSize[0] << ", " 
                  << deviceProp.maxGridSize[1] << ", " 
                  << deviceProp.maxGridSize[2] << "]" << std::endl;
        std::cout << "  Maximum Threads Dimensions: [" 
                  << deviceProp.maxThreadsDim[0] << ", " 
                  << deviceProp.maxThreadsDim[1] << ", " 
                  << deviceProp.maxThreadsDim[2] << "]" << std::endl;
    }

    return EXIT_SUCCESS;
}
