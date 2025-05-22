#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

ARG UBUNTU_VERSION=24.04
ARG BUNDLER_VERSION=2.5.22

FROM ubuntu:${UBUNTU_VERSION} AS base

LABEL maintainer="pbertoni@x-next.com"

# https://askubuntu.com/questions/909277/
# interactive prompt somehow stucks with -y
# ARG DEBIAN_FRONTEND=noninteractive

# Avoid the "debconf: delaying package configuration" warning
# RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get update && apt-get install -y ruby-full build-essential

ADD https://github.com/sass/dart-sass/releases/download/1.89.0/dart-sass-1.89.0-linux-x64.tar.gz /opt/sass.tar.gz

RUN tar -C /opt -xf /opt/sass.tar.gz

ENV PATH="${PATH}:/opt/dart-sass/"

# These needs a mounted Jekyll website
# variable evalutation does not work ??
# RUN rm -f Gemfile.lock && gem install bundler -v ${BUNDLER_VERSION} && bundle install
#`RUN rm -f Gemfile.lock
# RUN gem install bundler -v 2.5.22
# RUN bundle install

EXPOSE 4000
