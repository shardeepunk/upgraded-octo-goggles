# upgraded-octo-goggles
demo

## Herdr setup

On your laptop (macOS/Linux):

```bash
git clone https://github.com/shardeepunk/upgraded-octo-goggles && cd upgraded-octo-goggles
git checkout ccr-333b2eff-ppho0v
sh scripts/setup-herdr.sh
herdr
```

The script installs Herdr (Homebrew if available, otherwise the official installer), then runs `herdr integration install claude` if Claude Code is installed.
