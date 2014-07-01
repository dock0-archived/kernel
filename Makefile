DIR = $(shell pwd)
NEW_CONFIG = $(shell git status -s | grep '?? config/' | sed 's/.*//')

.PHONY : default build_container manual container build push

default: container push

build_container:
	docker build -t kernels meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch

build:
	roller.py -v $(VERSION) -n next -b /opt/build -d configs -p $(DIR)/patches/next
	mkdir -p build
	mv /boot/vmlinuz* build/
	cp -R patches/next patches/$(NEW_CONFIG)

push:


