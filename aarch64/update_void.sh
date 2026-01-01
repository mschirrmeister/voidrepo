#!/bin/bash
# update_void.sh - The "Stupid Simple" Void version to update the repo

# 1. Clean the deck of detached sigs
rm -f *.sig2

# 2. Build/Refresh the manifest from scratch
# This is mandatory since you moved files manually from the Factory to the Vault
echo "[+] Adding packages to the manifest..."
xbps-rindex -a *.xbps

# 3. Sign the cargo (This handles the binaries)
echo "[+] Signing the cargo..."
xbps-rindex --privkey ~/.ssh/msc-syndicate.pem -S *.xbps

# 4. Seal the manifest (This handles the repodata)
echo "[+] Sealing the manifest..."
xbps-rindex --privkey ~/.ssh/msc-syndicate.pem --signedby "Marco Schirrmeister" -s .

apindex .

echo "[+] Void Repo Updated!!"
