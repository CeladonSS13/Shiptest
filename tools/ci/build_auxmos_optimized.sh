#!/bin/bash
# Оптимизированная сборка AUXMOS

export RUSTFLAGS="-C target-cpu=native -C opt-level=3 -C lto=fat"
export CARGO_PROFILE_RELEASE_LTO=true
export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

cd auxmos
cargo build --release --features "all_gases,katmos"
cp target/release/auxmos.dll ../auxmos.dll