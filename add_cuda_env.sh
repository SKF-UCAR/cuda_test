#!/bin/bash

# Define the CUDA paths 
# Change if yours is different!!!
CUDA_PATH="/usr/local/cuda/bin"
CUDA_LIB_PATH="/usr/local/cuda/lib64"

# Function to add CUDA paths to .bashrc if not present
add_cuda_to_bashrc() {
    # Check if the export lines are already in .bashrc
    if ! grep -q "export PATH=.*$CUDA_PATH" ~/.bashrc; then
        echo "Adding CUDA path to ~/.bashrc..."
        echo "export PATH=/usr/local/cuda/bin:\$PATH" >> ~/.bashrc
    else
        echo "CUDA path is already in ~/.bashrc."
    fi

    if ! grep -q "export LD_LIBRARY_PATH=.*$CUDA_LIB_PATH" ~/.bashrc; then
        echo "Adding CUDA library path to ~/.bashrc..."
        echo "export LD_LIBRARY_PATH=/usr/local/cuda/lib64:\$LD_LIBRARY_PATH" >> ~/.bashrc
    else
        echo "CUDA library path is already in ~/.bashrc."
    fi
}

# Check if PATH contains CUDA_PATH
if [[ ":$PATH:" != *":$CUDA_PATH:"* ]]; then
    echo "CUDA path not found in PATH."
    add_cuda_to_bashrc
else
    echo "CUDA path already exists in PATH."
fi
