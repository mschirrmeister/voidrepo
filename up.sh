#!/bin/bash
# up-void.sh - Smart Cartel Commits

# 1. Update the local index and signatures
cd aarch64
sh update_void.sh
cd ..

# 1. We use xargs -r so it doesn't run if the grep comes up empty
# We also redirect stderr to /dev/null to kill any remaining noise
MODIFIED_CARGO=$(git status --short aarch64/ | grep '\.xbps$' | awk '{print $2}' | xargs -r -n1 basename 2>/dev/null | sed 's/\.aarch64\.xbps//' | tr '\n' ' ' | sed 's/ $//')

# 3. Handle the Commit
if [ -z "$MODIFIED_CARGO" ]; then
    MODIFIED_CARGO="repository metadata"
    COMMIT_MSG="void repo manifest update: $(date +%Y-%m-%d)"
else
    COMMIT_MSG="void repo update: $MODIFIED_CARGO"
fi

# 4. Git hustle
echo "[+] Committing: $COMMIT_MSG"
git add --all .
git commit -m "$COMMIT_MSG"
git push origin main

echo "[+] Git Push Done. $MODIFIED_CARGO is live on the block."
