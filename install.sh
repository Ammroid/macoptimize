#!/bin/bash
set -e

INSTALL_DIR="$HOME/bin"
SCRIPT_NAME="macoptimize"
REPO_URL="https://raw.githubusercontent.com/knowamit/macoptimize/main/macoptimize"

echo "Installing macoptimize..."

mkdir -p "$INSTALL_DIR"

curl -fsSL "$REPO_URL" -o "$INSTALL_DIR/$SCRIPT_NAME"
chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

# Add ~/bin to PATH if not already there
SHELL_RC="$HOME/.zshrc"
[[ "$SHELL" == *"bash"* ]] && SHELL_RC="$HOME/.bashrc"

if ! grep -q 'export PATH="$HOME/bin:$PATH"' "$SHELL_RC" 2>/dev/null; then
    echo '' >> "$SHELL_RC"
    echo 'export PATH="$HOME/bin:$PATH"' >> "$SHELL_RC"
    echo "Added ~/bin to PATH in $SHELL_RC"
fi

export PATH="$HOME/bin:$PATH"

echo ""
echo "macoptimize installed successfully!"
echo "Run: macoptimize status"
echo ""
echo "If command not found, restart your terminal or run: source $SHELL_RC"
