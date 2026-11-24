# Vora Compute — Desktop releases

Official desktop installers for **Vora Compute** (`Code` & `Work` agent workspace on sovereign European GPUs, zero prompt logs).

## Quick install on macOS (Apple Silicon)

```sh
curl -fsSL https://raw.githubusercontent.com/voracompute/desktop-releases/main/install.sh | sh
```

## Direct downloads (v0.1.1)

- **Apple Silicon (M1 / M2 / M3 / M4 / M5 / M6):** [Vora Compute-0.1.1-arm64.dmg](https://github.com/voracompute/desktop-releases/releases/download/v0.1.1/Vora.Compute-0.1.1-arm64.dmg)
- **Intel Mac (x64):** [Vora Compute-0.1.1.dmg](https://github.com/voracompute/desktop-releases/releases/download/v0.1.1/Vora.Compute-0.1.1.dmg)
- **All releases & SHA-256 checksums:** [Releases](https://github.com/voracompute/desktop-releases/releases)

> **Note on browser downloads (before Apple Notarization):** If you download the `.dmg` in a browser and macOS says it cannot verify the developer, open **System Settings → Privacy & Security → Open Anyway**, or run `xattr -dr com.apple.quarantine "/Applications/Vora Compute.app"`.

## Documentation

- Getting started & API keys: https://inference.voracompute.com/docs
- CLI (`@voracompute/cli`): https://inference.voracompute.com/docs/cli
