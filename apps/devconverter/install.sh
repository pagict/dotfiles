#!/bin/bash
set -euo pipefail

arch="$(uname -m)"
case "$arch" in
  arm64) asset="DevConverter-macos-arm64.zip" ;;
  x86_64) asset="DevConverter-macos-x64.zip" ;;
  *) echo "Unsupported macOS architecture: $arch" >&2; exit 1 ;;
esac
url="https://github.com/pagict/DevConverter/releases/latest/download/${asset}"

tmp="$(mktemp -d "${TMPDIR:-/tmp}/devconverter.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT
curl --fail --location --retry 3 --output "$tmp/$asset" "$url"
ditto -x -k "$tmp/$asset" "$tmp/unpacked"

app="$tmp/unpacked/DevConverter Spotlight.app"
[[ -d "$app" ]] || { echo 'DevConverter app missing from release archive.' >&2; exit 1; }
mkdir -p "$HOME/Applications" "$HOME/.local/bin"
rm -rf "$HOME/Applications/DevConverter Spotlight.app"
ditto "$app" "$HOME/Applications/DevConverter Spotlight.app"
ln -sfn "$HOME/Applications/DevConverter Spotlight.app/Contents/Resources/devconvert" "$HOME/.local/bin/devconvert"
open "$HOME/Applications/DevConverter Spotlight.app"

echo 'Latest DevConverter release installed.'
echo 'Assign Quick Key "dev" to "Dev Convert" in System Settings > Spotlight > Quick Keys.'
