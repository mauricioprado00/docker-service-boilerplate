FROM alpine:latest

ADD app /app/
RUN apk add bash
RUN mkfifo /input
ENTRYPOINT ["/app/entrypoint.sh"]