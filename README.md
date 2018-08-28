kernel
=======

[![Build Status](https://img.shields.io/travis/com/dock0/kernel.svg)](https://travis-ci.com/dock0/kernel)
[![GitHub release](https://img.shields.io/github/release/dock0/kernel.svg)](https://github.com/dock0/kernel/releases)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

Kernel builder and configs for my servers. Building uses [roller](https://github.com/akerl/roller) inside a [Docker](https://docker.com) container.

Feel free to borrow them if you'd like. I use them primarily on my Linodes (www.linode.com) for Archlinux servers.

## To release a new kernel

### Generate the new config

Run `make manual` and `./dev/config-gen.py configs/OLD_VERSION` to generate a new config for the latest mainline kernel. You can optionally generate the config for a different kernel version by using the `-k` option.

### Test the new config locally

To test the build, you can run `make manual` and then `./dev/build.rb configs/NEW_CONFIG`

### Push to GitHub

Commit the new config and push to GitHub, which will kick off a build [in Circle](https://travis-ci.com/dock0/kernel/tree/master) and expose the resulting vmlinuz file.

### Tag the release

Tag the release with the version/revision and push the tag, which will build the kernel in Circle and then create a [GitHub release asset](https://github.com/dock0/kernel/releases) from it.

## Debugging

To start a shell inside the Docker build environment for manual actions, use `make manual`.

## License

The scripts in this repository are released under the MIT license. See the bundled LICENSE file for details.

