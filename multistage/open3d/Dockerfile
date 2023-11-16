# Stage1 : build open3d
FROM open3d-ci:openblas-arm64-py311-dev as builder

WORKDIR /Open3D/build

# new image contains need only files
FROM ubuntu:20.04

# Copy Open3D build
COPY --from=builder /root/open3d_install /open3d_build


# Update package list and install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    libgl1 \
    libgomp1 \
    libusb-1.0-0 \
    xorg-dev \
    libxcb-shm0 \
    libglu1-mesa-dev \
    python3-dev \
    libsdl2-dev \
    ninja-build \
    libxi-dev \
    libtbb-dev \
    libosmesa6-dev \
    libudev-dev \
    autoconf \
    libtool \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Install libc++-dev separately
RUN apt-get update && apt-get install -y \
    clang \
    libc++-dev \
    libc++abi-dev \
    cmake \
    g++ \
    gfortran \
    build-essential gdb \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variable
ENV LD_LIBRARY_PATH=/open3d_build/lib:$LD_LIBRARY_PATH

# Adjust 18.04(/usr/lib/gcc/aarch64-linux-gnu/7/) to 20.04(/usr/lib/gcc/aarch64-linux-gnu/9/)
RUN mkdir -p /usr/lib/gcc/aarch64-linux-gnu/7/ && \
    for file in /usr/lib/gcc/aarch64-linux-gnu/9/*.a; do ln -s "$file" "/usr/lib/gcc/aarch64-linux-gnu/7/$(basename "$file")"; done && \
    for file in /usr/lib/gcc/aarch64-linux-gnu/9/*.so; do ln -s "$file" "/usr/lib/gcc/aarch64-linux-gnu/7/$(basename "$file")"; done

RUN mkdir -p /usr/lib/llvm-7/lib/ && \
    for file in //usr/lib/llvm-10/lib/*.a; do ln -s "$file" "/usr/lib/llvm-7/lib/$(basename "$file")"; done && \
    for file in //usr/lib/llvm-10/lib/*.so; do ln -s "$file" "/usr/lib/llvm-7/lib/$(basename "$file")"; done 
    
CMD ["/bin/bash"]
