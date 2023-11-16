#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version> (e.g.) $0 0.1"
    exit 1
fi

version=$1

docker build -f ./open3d/cpu/Dockerfile -t open3d_container:ver${version}_cpu .