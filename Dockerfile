FROM debian:bullseye-slim

RUN apt-get update

RUN apt-get install -y xterm

CMD ["xterm"]
