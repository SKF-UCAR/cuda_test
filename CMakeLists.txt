cmake_minimum_required(VERSION 3.20)  # Minimum required version of CMake

# Specify the CUDA toolkit location
set(CUDAToolkit_ROOT "/usr/local/cuda")  # Adjust this path to your CUDA installation

# Set CUDA architectures to target
set(CMAKE_CUDA_ARCHITECTURES "70;75;80;86")  # Use the appropriate architecture number for your GPU

# Project name and enable CUDA language
project(cuda_test LANGUAGES CXX CUDA)



# Set the CUDA version to 12.6
set(CMAKE_CUDA_STANDARD 14)
set(CMAKE_CUDA_COMPILER_VERSION 12.6)

# Specify the CUDA toolkit location (optional, in case CMake doesn't find it automatically)
# set(CUDAToolkit_ROOT /usr/local/cuda-12.6)  # Adjust path as necessary

# Add the CUDA source file to the executable
add_executable(cuda_test cuda_test.cu)

# Set the target properties to use the correct CUDA architecture and standard
set_target_properties(cuda_test PROPERTIES
    CUDA_SEPARABLE_COMPILATION ON   # Enable separable compilation
    CUDA_STANDARD 14                # Set CUDA C++ standard to C++14
)

# Optionally, specify the GPU architectures you want to target
# set_property(TARGET cuda_test PROPERTY CUDA_ARCHITECTURES 75)  # Adjust the architecture as needed
