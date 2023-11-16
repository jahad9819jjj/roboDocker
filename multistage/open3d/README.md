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