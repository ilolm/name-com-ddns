FROM alpine:3.20.3

LABEL org.opencontainers.image.authors="Nikolay Ogorodnik <Ilolm@proton.me>, Lowie Huyghe <iam@lowiehuyghe.com>" \
      org.opencontainers.image.description="Dynamic DNS for name.com ."

# Setup source code
WORKDIR /opt/name-com-ddns

RUN echo "Installing dependencies." \
    && apk update --no-cache \
    && apk add --no-cache curl jq && \

    echo "Setup cron." \
    && echo '*/5  *  *  *  *    cd /opt/name-com-ddns && ./run.sh > /dev/null' > /var/spool/cron/crontabs/root

COPY ./src ./src/
COPY ./run.sh ./

# Run the command on container startup
ENTRYPOINT ["crond", "-f", "-l", "9"]
