#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

version=$1
image_name="open3d_only:ver${version}_cpu"

# for mac
export HOSTNAME=`hostname`
xhost +${HOSTNAME}
docker run -it  \
--mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
-e DISPLAY=host.docker.internal:0 ${image_name} bash