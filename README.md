# DEPRECATED

Rinkudesu will use [Bitnami image](https://hub.docker.com/r/bitnami/kafka/) instead, as it's less needless maintenance work on our side.

# kafka-docker

This is a dockerised version of [Apache Kafka](https://kafka.apache.org/) intended for use with Rinkudesu.

To build, simply run `docker build -t kafka-docker .`, or you can just use the docker-compose with provided images.

To change configuration, use mounts in docker-compose (see commented example in said file).
