#!/bin/bash

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

chmod +x "$PROJECT_DIR/main.sh"

ln -sf "$PROJECT_DIR/main.sh" "$INSTALL_DIR/glados"
