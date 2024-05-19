FROM python:3.11-slim

VOLUME /config

ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y git wget && \ 
git clone https://github.com/TD22057/insteon-mqtt.git /opt/insteon-mqtt && \
pip install /opt/insteon-mqtt && \
rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh entrypoint.sh

EXPOSE 8099/tcp
EXPOSE 8099/udp

CMD ["/entrypoint.sh" ]
