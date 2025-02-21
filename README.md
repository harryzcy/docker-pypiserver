# docker-pypiserver

NOTICE: This repository has been moved to [container-images](https://github.com/harryzcy/container-images)

Docker container for [pypiserver](https://github.com/pypiserver/pypiserver)

## Usage

```shell
docker run -d -p 8080:8080 -v PATH/TO/PACKAGES:/data/packages harryzcy/pypiserver
```
