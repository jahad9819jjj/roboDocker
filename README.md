# roboDocker

This repository focuses on addressing the barrier of environment setup that often obstructs individuals who are new to the field of robotics software development, especially those who work with 3D point cloud processing software. Moreover, not only beginners, but even experienced developers can benefit from this repository as it reduces the likelihood of encountering complex environment setup troubles, and facilitates easy modification of source code of libraries such as OpenCV, Open3D and OMPL. The purpose of this repository is to make the environment setup process simpler and smoother, and allow for greater ease in modifying source code, which is why we created it.


## Support Environment
* M1 Mac(`arm64`)
* WSL2(`x64`)
    * Ubuntu20.04
    * Ubuntu22.04

## TODOLIST
- [ ] open3D
- [ ] openCV
- [ ] OMPL
- [ ] open3D + openCV(multi-stage build) 
- [ ] openCV + torch(multi-stage build)
- [ ] open3D + openCV + torch(multi-stage build)

## Set proxy
### `/etc/docker/daemon.json`
```
{
    "proxies": {
        "default": {
            "httpProxy": "http://<プロキシサーバーのアドレス>:<ポート>",
            "httpsProxy": "http://<プロキシサーバーのアドレス>:<ポート>",
            "noProxy": "localhost,127.0.0.1"
        }
    }
}
```

```
sudo service docker restart
OR
sudo systemctl restart docker
```

### inside Dockerfile
```
ENV http_proxy http://<プロキシサーバーのアドレス>:<ポート>
ENV https_proxy http://<プロキシサーバーのアドレス>:<ポート>
ENV no_proxy localhost,127.0.0.1
```

### `docker run`
```
docker run -e http_proxy=http://<プロキシサーバーのアドレス>:<ポート> \
           -e https_proxy=http://<プロキシサーバーのアドレス>:<ポート> \
           -e no_proxy=localhost,127.0.0.1 \
           <その他のオプション> <イメージ名>
```

### `docker-compose.yml`
```
services:
  myservice:
    image: myimage
    environment:
      - http_proxy=http://<プロキシサーバーのアドレス>:<ポート>
      - https_proxy=http://<プロキシサーバーのアドレス>:<ポート>
      - no_proxy=localhost,127.0.0.1
```