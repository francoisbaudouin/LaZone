# syntax=docker/dockerfile:1

FROM cirrusci/flutter:latest

COPY . /lazone
WORKDIR /lazone

USER root

EXPOSE 8081

RUN flutter doctor

RUN flutter clean

RUN flutter config --enable-web \
    && flutter precache --universal --web \
    && flutter build web

RUN ["chmod", "+x", "/lazone/server-py.sh"]

ENTRYPOINT [ "/lazone/server-py.sh"]