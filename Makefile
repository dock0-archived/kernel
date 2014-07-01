DIR=$(shell pwd)

ifeq ($(VERSION),)
	VERSION := 
else
	VERSION := -k$(VERSION)
endif

.PHONY : default build_container manual container build push

default: container push

build_container:
	docker build -t kernels meta

manual: build_container
	./meta/launch /bin/bash

container: build_container
	./meta/launch

build:
	roller.py -v $(VERSION) -n next -b /opt/build -d configs -p patches/next
	mkdir -p build
	mv /boot/vmlinuz* build/
	NEW_CONFIG := $(shell git status -s | grep '?? config/' | sed 's/.*//')
	cp -R configs/patches/next configs/patches/$(NEW_CONFIG)

push:


