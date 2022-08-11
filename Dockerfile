FROM ubuntu:22.04 AS staging

ENV kafka_version=3.2.1

RUN apt update  \
    && apt install wget ca-certificates --no-install-recommends -y \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-ca-certificates
RUN wget https://dlcdn.apache.org/kafka/${kafka_version}/kafka_2.13-${kafka_version}.tgz && tar -xzf kafka_2.13-${kafka_version}.tgz && rm kafka_2.13-${kafka_version}.tgz && mv kafka_2.13-${kafka_version} kafka

FROM ubuntu:22.04 as final

RUN apt update \
    && apt install default-jre -y --no-install-recommends \
    && apt clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /kafka
COPY --from=staging /kafka/ .

RUN sed -i 's/localhost:2181/kafka-zookeeper:2181/g' config/server.properties

EXPOSE 2181 9092
