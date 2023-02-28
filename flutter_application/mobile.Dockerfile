# syntax=docker/dockerfile:1

FROM cirrusci/flutter:latest

COPY . /lazone
WORKDIR /lazone

USER root

RUN flutter doctor

RUN flutter clean

RUN flutter pub get

RUN flutter config --enable-android \
    && flutter precache --universal --android \
    && flutter build apk

RUN mkdir /areapp/

ENTRYPOINT cp build/app/outputs/apk/release/app-release.apk /areapp/client.apk
