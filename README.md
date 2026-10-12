# voidrepo

Signed binary repository for Void Linux on aarch64. All packages are compiled natively on Apple Silicon (M4 Pro) and signed with an RSA-4096 key. The build templates live in [void-templates](https://github.com/mschirrmeister/void-templates).

## Usage

### 1. Import the public key

XBPS only installs packages from repositories it trusts. Import the public key first:

```bash
FP="d6:e0:46:a7:79:30:23:d4:31:ce:d1:35:1e:cf:db:44"
sudo curl -L -o "/var/db/xbps/keys/${FP}.plist" "https://mschirrmeister.github.io/voidrepo/msc-syndicate.plist"
```

### 2. Add the repository

```bash
echo "repository=https://mschirrmeister.github.io/voidrepo/aarch64" | sudo tee /etc/xbps.d/msc-repo.conf
```

### 3. Sync and install the keyring

Installing `msc-keyring` keeps the key trusted across updates:

```bash
sudo xbps-install -Sy msc-keyring
```

## Packages

Kernels are lean builds with BTF enabled for eBPF and Cilium. Each series has a matching `-headers` package.

- `linux6.18-msc` tracks the 6.18 LTS series.
- `linux7.1-msc` and `linux7.2-msc` track current stable series.
- `linux7.3-msc-rc` tracks the mainline release candidates.

Firmware and bootloader:

- `atf-rk3576-bl31` is a modular ARM Trusted Firmware build for the NanoPi R76S.
- `nanopi-r76s-uboot` is U-Boot with Distro Boot support.

Other packages:

- `msc-keyring` installs the repository signing key.
- `tssh`, `tsshd` and `sshoq` are SSH tools packaged for aarch64.

## Disclaimer

These packages are provided as is, without warranty of any kind. Flashing firmware or bootloaders can leave a board unbootable, so use them at your own risk.

## Maintainer

Marco Schirrmeister ([mschirrmeister@gmail.com](mailto:mschirrmeister@gmail.com))
