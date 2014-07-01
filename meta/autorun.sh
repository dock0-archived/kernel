#!/usr/bin/env bash

[[ -n "$VERSION" ]] && version="-k$VERSION"

roller.py -v $version -n next -b /opt/build -d /opt/kernels/configs -p /opt/kernels/patches/next || exit 1
mkdir -p /opt/kernels/build
mv /boot/vmlinuz* /opt/kernels/build/
