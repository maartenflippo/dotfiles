#!/usr/bin/env bash

LOCAL_PARSER_SOURCES="$HOME/.config/nvim/tree-sitter-parsers"
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

update_local_parser() {
  local name=$1
  echo "Updating parser from $name..."

  local dir="$LOCAL_PARSER_SOURCES/tree-sitter-$name"
  cd "$dir"

  echo "  Compiling parser..."
  gcc -o "$PARSER_DIR/$name.so" -shared -fPIC -O2 \
    src/parser.c $(test -f src/scanner.c && echo src/scanner.c) -I src

  echo "  Copying queries..."
  mkdir -p "$QUERY_DIR/$name/"
  cp queries/*.scm "$QUERY_DIR/$name/"
}

update_manual_parser() {
  local name=$1 repo=$2
  echo "You should update the parser for $name manually."
  echo "  Repository: $2"
}

update_parser rust https://github.com/tree-sitter/tree-sitter-rust
update_parser python https://github.com/tree-sitter/tree-sitter-python
update_parser lean https://github.com/Julian/tree-sitter-lean
update_parser kotlin https://github.com/fwcd/tree-sitter-kotlin
update_parser java https://github.com/tree-sitter/tree-sitter-java
update_parser wgsl https://github.com/szebniok/tree-sitter-wgsl

update_local_parser minizinc
update_local_parser datazinc

update_manual_parser latex https://github.com/tree-sitter/tree-sitter-latex
