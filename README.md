kernel
=======

Kernel builder and configs for my servers

Feel free to borrow them if you'd like. I use them primarily on my Linodes (www.linode.com) for Archlinux servers.

## To build

Building uses [roller](https://github.com/akerl/roller) inside a [Docker](https://docker.com) container.

To build a new kernel, run `make`. To build a specific version, set a VERSION environment variable:

```
VERSION=3.16-rc3 make
```

To start a shell inside the Docker build environment for manual actions, use `make manual`.

## License

The scripts in this repository are released under the MIT license. See the bundled LICENSE file for details.

