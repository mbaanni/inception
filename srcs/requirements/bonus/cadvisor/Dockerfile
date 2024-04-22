FROM alpine:3.18.4

RUN apk update && apk add wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 -O cadvisor

RUN chmod +x cadvisor

ENTRYPOINT [ "./cadvisor" ]