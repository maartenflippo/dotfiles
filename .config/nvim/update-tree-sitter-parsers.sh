#!/usr/bin/env bash

PARSER_DIR="$HOME/.config/nvim/parser"
QUERY_DIR="$HOME/.config/nvim/queries"

update_parser() {
  local name=$1 repo=$2
  echo "Updating parser for $name..."

  local dir="/tmp/ts-$name"

  git clone --depth 1 "$repo" "$dir" 2>/dev/null || git -C "$dir" pull
  cd "$dir"

  echo "  Compiling parser..."
  gcc -o "$PARSER_DIR/$name.so" -shared -fPIC -O2 \
    src/parser.c $(test -f src/scanner.c && echo src/scanner.c) -I src

  echo "  Copying queries..."
  mkdir -p "$QUERY_DIR/$name/"
  cp queries/*.scm "$QUERY_DIR/$name/"
}

update_parser rust https://github.com/tree-sitter/tree-sitter-rust
update_parser python https://github.com/tree-sitter/tree-sitter-python
