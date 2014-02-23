#!/usr/bin/env bash

roller.py -v -n next -b /opt/build -d /opt/configs || exit 1
mkdir -p /opt/output
rm -rf /opt/output/configs
cp -pR /opt/configs /opt/output/configs
cp /boot/vmlinuz* /opt/output/
NEW_CONFIG="$(git status -s | awk '/??/ {print $2}')"
gist /opt/kernels/configs/$NEW_CONFIG
