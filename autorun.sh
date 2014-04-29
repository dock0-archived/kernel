#!/usr/bin/env bash

[[ -n "$version" ]] && version="-k$version"

roller.py -v $version -n next -b /opt/build -d /opt/configs || exit 1
mkdir -p /opt/output
rm -rf /opt/output/configs
cp -pR /opt/configs /opt/output/configs
cp /boot/vmlinuz* /opt/output/
cd /opt/output/configs
git remote set-url origin git@github.com:akerl/kernels
NEW_CONFIG="$(git status -s | awk '/??/ {print $2}')"
gist -R /opt/output/configs/$NEW_CONFIG
