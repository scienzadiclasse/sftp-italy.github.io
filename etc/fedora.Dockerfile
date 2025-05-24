#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

ARG FC_VERSION=42
ARG BUNDLER_VERSION=2.5.22

FROM fedora:${FC_VERSION} AS base

LABEL maintainer="pbertoni@x-next.com"

RUN dnf install gcc glibc-devel glibc-headers rubygem-jekyll

# RUN dnf reinstall gcc glibc-devel glibc-headers


ADD https://github.com/sass/dart-sass/releases/download/1.89.0/dart-sass-1.89.0-linux-x64.tar.gz /opt/sass.tar.gz

RUN tar -C /opt -xf /opt/sass.tar.gz

ENV PATH="${PATH}:/opt/dart-sass/"

EXPOSE 4000
