# docker-pypiserver

Docker container for [pypiserver](https://github.com/pypiserver/pypiserver)

## Usage

```shell
docker run -d -p 8080:8080 -v PATH/TO/PACKAGES:/data/packages harryzcy/pypiserver
```
