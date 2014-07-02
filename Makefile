DIR = $(shell pwd)
NEW_CONFIG=$(shell git status -s | grep '?? configs/' | sed 's|.*/||')

.PHONY : default build_container manual container build push

default: container

build_container:
	docker build -t kernels meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch
	make push

build:
	roller.py -v $(VERSION) -n next -b /opt/build -d configs -p $(DIR)/patches/next
	mkdir -p build
	mv /boot/vmlinuz* build/

push:
	cp -R patches/next patches/$(NEW_CONFIG)
	git add patches/$(NEW_CONFIG) configs/$(NEW_CONFIG)
	git commit -m "$(NEW_CONFIG)"
	git tag $(NEW_CONFIG)
	git push --tags origin master
	targit -c -f akerl/kernels $(NEW_CONFIG) build/vmlinuz-$(NEW_CONFIG)

