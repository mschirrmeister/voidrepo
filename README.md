## Overview

This is the binary distribution center for the **MSC Void Repository**. All packages are natively compiled on **aarch64** (Apple M4 Pro) and signed with RSA-4096.

## How to use the Stash

### 1. Import the Master Key
XBPS requires you to trust the authority before it will touch the cargo. Import the public key `.plist` to your system vault:

```bash
FP="d6:e0:46:a7:79:30:23:d4:31:ce:d1:35:1e:cf:db:44"
sudo curl -L -o "/var/db/xbps/keys/${FP}.plist" "https://mschirrmeister.github.io/voidrepo/msc-syndicate.plist"
```

### 2. Connect the Supply Line
Add this repository to your system's configuration:

```bash
echo "repository=https://mschirrmeister.github.io/voidrepo/aarch64" | sudo tee /etc/xbps.d/msc-repo.conf
```

### 3. Sync and Install
Update your index and install the `msc-keyring` to keep the trust permanent:

```bash
sudo xbps-install -Sy msc-keyring
```

## Featured Weight
- **`atf-rk3576-bl31`**: Modular ARM Trusted Firmware for the NanoPi R76S.
- **`nanopi-r76s-uboot`**: Optimized U-Boot with Distro Boot support.
- **`linux6.19-msc-rc`**: Lean, surgical kernel with BTF enabled for full eBPF/Cilium operations.

## Sources
Blueprints and build templates can be found at: [void-templates](https://github.com/mschirrmeister/void-templates)

---

## Disclaimer

> **This cargo is provided AS-IS. If it bricks your board or burns down your safehouse, that's on you. I'm just the mule, not the manufacturer.**

Use of these packages is at your own risk. No warranties, no guarantees, just raw performance.

## Maintainer
**Marco Schirrmeister** - [mschirrmeister@gmail.com](mailto:mschirrmeister@gmail.com)
