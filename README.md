# Docker clients

This container has each version docker applications.
You can operate a other host docker system by Docker API.

## Build

```bash
docker build -t minanon/dockerclients .
```

## Example

You can structure multi container by using this container.
Please inherit this container and structure script.

### Dockerfile

Please inherit this container when you create your structure container.

```
FROM minanon/dockerclient

MAINTAINER minanon

ADD add_files/structure.sh /structure.sh

CMD ["/bin/bash", "/structure.sh"]
```

### structure.sh

Please structure servers for your system by command-line.

```bash
# use latest version
${DOCKER} -H "${DOCKER_HOST}" run debian

# use 1.2 version
${DOCKER_1_2} -H "${DOCKER_HOST}" run centos
```

### run
Please build your structure container and run.

```bash
docker run -e DOCKER_HOST='172.17.42.1:4243' <your container>
```

## Requirement

Please enable Docker API for accessing TCP on docker server.

```bash
cp /usr/lib/systemd/system/docker.service /etc/systemd/system/docker.service
# edit start command to listen tcp
# ExecStart=/usr/bin/docker -d -H fd:// -H tcp://0.0.0.0:4243
systemctl daemon-reload
systemctl restart docker
```
