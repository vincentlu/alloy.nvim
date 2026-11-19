#!/bin/sh
# Compiles the tree-sitter parser and places it where Neovim expects it.
# Usage: ./build.sh /path/to/tree-sitter-alloy
set -e

GRAMMAR_DIR="${1:?Usage: ./build.sh /path/to/tree-sitter-alloy}"
PLUGIN_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$PLUGIN_DIR/parser"

mkdir -p "$OUT_DIR"
cc -fPIC -o "$OUT_DIR/alloy.so" -shared "$GRAMMAR_DIR/src/parser.c" -I"$GRAMMAR_DIR/src" -Os
echo "Built $OUT_DIR/alloy.so"
