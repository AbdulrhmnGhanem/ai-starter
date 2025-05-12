#!/bin/bash

set -Eeuxo pipefail

# 1. Install packages
echo "Install python packages..."
uv sync --all-extras --dev

HOME=/home/vscode

# 2. Add poe completion to the shell
echo "Installing poe completion..."
mkdir -p $HOME/.oh-my-zsh/completions && uv run poe _zsh_completion > $HOME/.oh-my-zsh/completions/_poe

#  3. Install pre-commit hooks
echo "Installing pre-commit hooks..."
uv run pre-commit install

# 4. Configure zsh
echo "Configuring zsh theme..."
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="amuse"/' $HOME/.zshrc

# 5. Alias ipython
echo "Configuring ipython alias..."
echo "alias ipy='ipython'" >> $HOME/.zshrc

# 6. Install ollama
curl -fsSL https://ollama.com/install.sh | sh
