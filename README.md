This repository contains the site configuration for the Freifunk Aachen Gluon
firmware.

This branch is compatible to Gluon v2022.1.x which is based on OpenWRT 22.03

This config uses the upstream `gluon-mesh-vpn-wireguard` [^gluon-meshvpn] implementation.
Registration of the wireguard keys is done using a custom `wg-registration` package which sends the key through POST to our broker.

Firmware can be built using `make manifest` or `make sign` if a key for signing the manifest is existing in the home directory at `${HOME}/.gluon-secret-key`.
A single target can be built using:

`make build GLUON_TARGETS=lantiq-xrx200`

## CHANGELOG
The [CHANGELOG](./CHANGELOG.md) can be found [here](./CHANGELOG.md)

## Update site.mk packages

To update the site.mk packages, the `genpkglist.py` can be executed from the build server like:

```console
~/site-ffac$ ./contrib/genpkglist.py
```

The output must then be appended to the end of the `site.mk`

Currently outdated further information can be found in the Freifunk Wiki[^wiki]



[^wiki]: https://wiki.freifunk.net/Freifunk_Aachen/Firmware#Dokumentation
[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#wireguard

