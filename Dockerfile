FROM homeassistant/amd64-homeassistant-base

VOLUME /config

ENV LANG C.UTF-8

RUN apk --no-cache add python3-dev \ 
    git clone 'https://github.com/TD22057/insteon-mqtt.git' /opt/insteon-mqtt \
    pip install /opt/insteon-mqtt

COPY entrypoint.sh entrypoint.sh

CMD ["./entrypoint.sh" ]
