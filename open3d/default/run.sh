# for mac
export HOSTNAME=`hostname`
xhost +${HOSTNAME}
docker run -it  \
--mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.X11-unix \
--mount type=bind,src=/tmp/.X11-unix,dst=/tmp/.XIM-unix \
-e DISPLAY=host.docker.internal:0 open3d-ci:openblas-arm64-py310-dev bash
