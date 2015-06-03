DIR = $(shell pwd)
BUILD_DIR = /opt/tmp
NEW_CONFIG=$(shell git status -s | grep '?? configs/' | sed 's|.*/||')

.PHONY : default build_container manual container build push local

default: container

build_container:
	docker build -t kernel meta

manual: build_container
	./meta/launch /bin/bash || true

container: build_container
	./meta/launch

build:
	$(eval kernel := \
		$(shell roller.py \
		-v $(VERSION) \
		-n next \
		-b $(BUILD_DIR) \
		-d configs \
		-p $(DIR)/patches/next \
		-s \
		))
	echo $(kernel)
	cp $(kernel) build/vmlinuz
	cd $(shell dirname $(kernel))/../../../ && cp System.map build/System.map

push:
	ssh -oStrictHostKeyChecking=no git@github.com &>/dev/null || true
	mkdir -p patches/next
	cp -R patches/next patches/$(NEW_CONFIG)
	git add patches/$(NEW_CONFIG) configs/$(NEW_CONFIG)
	git commit -m "$(NEW_CONFIG)"
	git tag $(NEW_CONFIG)
	git push --tags origin master
	@sleep 3
	targit -a .github -c -f dock0/kernel $(NEW_CONFIG) build/vmlinuz

local: build push

