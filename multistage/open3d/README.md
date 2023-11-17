# Open3D Build

multistage/open3d/DockerfileはOpen3Dの公式Dockerイメージを用いてマルチステージビルドしている。
まずOpen3d公式がサポートしているDockerイメージをビルドする必要がある。


## In the case of M1 Mac
```
git clone https://github.com/isl-org/Open3D
cd Open3D/docker
./docker_build.sh openblas-arm64-py311-dev
```

```
cd ../../roboDocker
sh multistage/open3d/build.sh
```

## In the case of Ubuntu with NVIDIA Driver

### On proxy
Dockerfile.hogeにプロキシを記載する必要がある。
```
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles
ENV SUDO=command
```
この行の上に以下のように追記する

```
ENV http_proxy=http://ip:port
ENV https_proxy=http://ip:port
ENV ftp_proxy=http://ip:port
ENV no_proxy=127.0.0.1,localhost
```


### On cuda
Docker buildするさいにcudaを有効にする
Dockerfile.hogeに行き、cmakeのところで以下を追記する
```
-DBUILD_CUDA_MODULE=ONDockerfile.hoge
```

```
ubuntu@ubuntu:~$ docker images
REPOSITORY   TAG                        IMAGE ID       CREATED        SIZE
open3d-ci    openblas-amd64-py311-dev   2807704eb5a4   15 hours ago   17.2GB
ubuntu       latest                     e4c58958181a   6 weeks ago    77.8MB

ubuntu@rabbit:/mnt/d/workspace/roboDocker$ multistage/open3d/build.sh 0 open3d-ci:openblas-amd64-py311-dev

```