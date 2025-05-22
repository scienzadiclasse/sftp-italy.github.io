#!/bin/bash
#
# Authors: Patrizio Bertoni patrizio.bertoni.89@gmail.com
#

sudo dnf install gcc glibc-devel glibc-headers rubygem-jekyll

sudo dnf reinstall gcc glibc-devel glibc-headers

bundle clean --force
rm -rf vendor/bundle

export LDFLAGS="-L/usr/lib64 -fno-builtin"
export CFLAGS="-fno-builtin"
bundle install
