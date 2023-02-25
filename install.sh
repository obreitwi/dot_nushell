#!/bin/bash

set -Eeuo pipefail

sourcedir="$(dirname "$(readlink -m "${BASH_SOURCE[0]}")")"

# prefer neovim over vim
VIM="$(command -v nvim || command -v vim)"

symlink () {
    ln -sfv "$@"
}

if [ "${PREFIX:+x}" != "x" ]; then
    PREFIX="$HOME/.config"
fi

mkdir -p "${PREFIX}" || true

symlink -T "${sourcedir}" "${PREFIX}/nushell"
