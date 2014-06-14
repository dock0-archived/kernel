dock0/kernel
=======

[![Trusted Build](http://img.shields.io/badge/trusted-build-green.svg)](https://registry.hub.docker.com/u/dock0/kernel/)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-green.svg)](https://tldrlegal.com/license/mit-license)

A container for rolling new kernels. Based on [dock0/arch](https://github.com/dock0/arch), it uses [roller](https://github.com/akerl/roller) to build the kernels.

For best results, run this container with "/opt/kernels" as a volume:

```
docker run -t -i -v /opt/kernels:/opt/output dock0/kernel
```

To build a specific kernel, override the "version" variable:

```
docker run -e version=3.15-rc3 -t -i -v /opt/kernels:/opt/output dock0/kernel
```

## License

This repo is released under the MIT License. See the bundled LICENSE file for details.

