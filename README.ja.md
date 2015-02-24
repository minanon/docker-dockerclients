# Docker clients

このコンテナは、dockerコマンドの各バージョンを所持しています。
他のホストの Docker API を操作するのに役立ちます。

## ビルド
```bash
docker build -t minanon/dockerclients .
```

## 使用例
複数のコンテナからシステムを構築するための構築用コンテナとして使用できます。

### Dockerfile
このコンテナを継承して、構築用コンテナを作成してください。
```
FROM minanon/dockerclient

MAINTAINER minanon

ADD add_files/structure.sh /structure.sh

CMD ["/bin/bash", "/structure.sh"]
```

### structure.sh
構築用スクリプトをコマンドラインで書くことが可能です。

```bash
# use latest version
${DOCKER} -H "${DOCKER_HOST}" run debian

# use 1.2 version
${DOCKER_1_2} -H "${DOCKER_HOST}" run centos
```

### run
構築用コンテナをビルドして、実行します。

```bash
docker run -e DOCKER_HOST='172.17.42.1:4243' <your container>
```

## 前提条件
操作するdockerサーバーのDockerAPIを有効にしてください。

```bash
cp /usr/lib/systemd/system/docker.service /etc/systemd/system/docker.service
# edit start command to listen tcp
# ExecStart=/usr/bin/docker -d -H fd:// -H tcp://0.0.0.0:4243
systemctl daemon-reload
systemctl restart docker
```
