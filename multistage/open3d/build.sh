#!/bin/bash

# シェルスクリプトに引数としてバージョンを渡す
if [ $# -ne 2 ]; then
    echo "Usage: $0 <version> <stage1_image_name>"
    exit 1
fi

# バージョンを引数から取得
version=$1
stage1_image=$2

# Dockerイメージをビルド
docker build --build-arg STAGE1_IMAGE=${stage1_image} -f  ./multistage/open3d/Dockerfile -t open3d_only:ver${version}_cpu .