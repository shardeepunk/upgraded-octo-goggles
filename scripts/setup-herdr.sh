#!/usr/bin/env sh
# Install Herdr (https://herdr.dev), a terminal workspace manager for AI coding agents,
# and hook it up to Claude Code. Run on macOS or Linux: sh scripts/setup-herdr.sh
set -eu

if command -v herdr >/dev/null 2>&1; then
  echo "herdr already installed: $(herdr --version 2>/dev/null || echo unknown version)"
elif command -v brew >/dev/null 2>&1; then
  brew install herdr
else
  # Official installer: downloads the release binary into ~/.local/bin by default.
  curl -fsSL https://herdr.dev/install.sh | sh
fi

# The official installer puts herdr in ~/.local/bin, which may not be on PATH yet.
if ! command -v herdr >/dev/null 2>&1 && [ -x "$HOME/.local/bin/herdr" ]; then
  PATH="$HOME/.local/bin:$PATH"
  echo "note: add ~/.local/bin to your PATH to run herdr from new shells"
fi

# Claude Code integration gives herdr accurate working/blocked/idle status and session resume.
if command -v claude >/dev/null 2>&1; then
  herdr integration install claude
else
  echo "Claude Code not found; later run: herdr integration install claude"
fi

herdr integration status || true
echo "done. start herdr in your project directory with: herdr  (ctrl+b q detaches)"
