FROM alpine:3.11.3
MAINTAINER medeirosinacio@outlook.com

RUN apk add --no-cache --upgrade tzdata apk-cron fcgi bash && rm -rf /var/cache/apk/*

RUN mkdir /var/log &1> /dev/null

RUN ln -sf /proc/1/fd/1 /var/log/crontab.default.log

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]