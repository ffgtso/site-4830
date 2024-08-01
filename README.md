This repository contains the site configuration for 4830.org e. V.' Gluon firmware.

This branch is compatible to Gluon v2022.1.x (based on v2022.1.3 ATM) which is based on OpenWRT 22.03

This config uses the upstream `gluon-mesh-vpn-tunneldigger` [^gluon-meshvpn] implementation.

Firmware can be built using `make manifest` or `make sign` if a key for signing the manifest is existing in the home directory at `${HOME}/.gluon-secret-key`.
A single target can be built using:

`make build GLUON_TARGETS=lantiq-xrx200`

## Update site.mk packages

To update the site.mk packages, the `genpkglist.py` can be executed from the build server like:

```console
~/site-4830$ ./contrib/genpkglist.py
```

The output must then be appended to the end of the `site.mk`




[^gluon-meshvpn]: https://gluon.readthedocs.io/en/latest/features/vpn.html#mesh-vpn-tunneldigger