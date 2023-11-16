FROM ubuntu:20.04
ARG TARGETPLATFORM
ARG OPEN3D_VERSION=0.16.0
ARG DEBIAN_FRONTEND=noninteractive
ENV PYTHON_EXECUTABLE=/usr/bin/python3


ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y &&\
    # Install build tools, build dependencies and python
    apt-get install -y \
    apt-utils \
	python3-pip \
    build-essential \
    cmake \
    git \
    wget \
    unzip \
    yasm \
    pkg-config \
    checkinstall \
    cmake-curses-gui \
    ## Python
    python3-dev \
    python3-numpy \
    ipython3  && \
    rm -rf /var/lib/apt/lists/*


WORKDIR /opt/open3d

COPY open3d/install_deps_ubuntu.sh .
RUN apt install libssl-dev && wget https://cmake.org/files/v3.20/cmake-3.20.5.tar.gz && \
    tar -zxvf cmake-3.20.5.tar.gz && cd cmake-3.20.5 && \
    ./bootstrap && make && make install 

WORKDIR /opt/open3d
RUN ./install_deps_ubuntu.sh
ENV PYTHON_EXECUTABLE=/usr/bin/python3

RUN git clone https://github.com/isl-org/Open3D && \
    cd Open3D && mkdir build && cd build && \
    cmake .. && make -j 4 && make install

WORKDIR /workspace