#!/usr/bin/env sh

git clone https://github.com/powwu/dotspacemacs /tmp/dotspacemacs
cd /tmp/dotspacemacs
OLD_HASH="$(nix hash file /tmp/dotspacemacs/.spacemacs)"
rm /tmp/dotspacemacs/.spacemacs
cp ~/.spacemacs /tmp/dotspacemacs/.spacemacs
NEW_HASH="$(nix hash file /tmp/dotspacemacs/.spacemacs)"

git add -u .
git commit -m "$(date --iso-8601=s)"
git push

rm -rf /tmp/nixos
git clone https://github.com/powwu/nixos /tmp/nixos || exit
cd /tmp/nixos
sed -i "s|$OLD_HASH|$NEW_HASH|g" /tmp/nixos/home-manager/apps.nix
git add -u .
git commit -m "$(date --iso-8601=s)"
git push

echo "Remember to update your nix config:"
echo "sudo /etc/nixos/update-nix.sh"
