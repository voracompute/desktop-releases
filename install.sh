#!/bin/sh
set -eu

REPO="voracompute/desktop-releases"
VERSION="v0.1.3"
ARCH="$(uname -m)"

if [ "$(uname -s)" != "Darwin" ]; then
  echo "vora-desktop installer currently supports macOS. Download Windows/other builds from https://github.com/${REPO}/releases" >&2
  exit 1
fi

if [ "$ARCH" = "arm64" ]; then
  ASSET="Vora.Compute-0.1.3-arm64-mac.zip"
else
  echo "For Intel Macs (x64), download the DMG at:"
  echo "  https://github.com/${REPO}/releases/download/${VERSION}/Vora.Compute-0.1.3.dmg"
  exit 0
fi

TMP_DIR="$(mktemp -d)"
cleanup() { rm -rf "$TMP_DIR"; }
trap cleanup EXIT

echo "Downloading Vora Compute ${VERSION} (${ARCH})..."
curl -fL --progress-bar "https://github.com/${REPO}/releases/download/${VERSION}/${ASSET}" -o "${TMP_DIR}/${ASSET}"
curl -fsSL "https://github.com/${REPO}/releases/download/${VERSION}/SHA256SUMS.txt" -o "${TMP_DIR}/SHA256SUMS.txt"

EXPECTED_SHA="$(awk '/arm64-mac\.zip$/ { print $1 }' "${TMP_DIR}/SHA256SUMS.txt")"
ACTUAL_SHA="$(shasum -a 256 "${TMP_DIR}/${ASSET}" | awk '{ print $1 }')"

if [ -z "$EXPECTED_SHA" ] || [ "$EXPECTED_SHA" != "$ACTUAL_SHA" ]; then
  echo "SHA-256 verification failed (expected ${EXPECTED_SHA}, got ${ACTUAL_SHA})." >&2
  exit 1
fi

echo "Extracting to /Applications/Vora Compute.app..."
ditto -x -k "${TMP_DIR}/${ASSET}" "${TMP_DIR}/out"
pkill -f "/Applications/Vora Compute.app" 2>/dev/null || true
rm -rf "/Applications/Vora Compute.app"
mv "${TMP_DIR}/out/Vora Compute.app" "/Applications/Vora Compute.app"

echo "Installed /Applications/Vora Compute.app (${VERSION})."
