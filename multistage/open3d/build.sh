#!/bin/bash

# シェルスクリプトに引数としてバージョンを渡す
if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

# バージョンを引数から取得
version=$1

# Dockerイメージをビルド
docker build -f ./multistage/open3d/Dockerfile -t open3d_only:ver${version}_cpu .

