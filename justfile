build fruit='banana':
  #!/bin/bash
  set -eoux pipefail
  if [ ! -d {{ fruit }} ]; then
    >&2 echo 'pick a different fruit'
    exit 1
  fi

  (
    cd {{fruit}}
    cargo build --release
    <target/wasm32-wasi/release/{{fruit}}.wasm wasm-opt -Oz -o target/wasm32-wasi/release/{{ fruit }}-opt.wasm
  )

  # download the "reactor" (or "cdylib") version of the wasi preview1 adaptor
  if [ ! -e target/wasi_snapshot_preview1.wasm ]; then
    BASE_URL=https://github.com/bytecodealliance/preview2-prototyping/releases/download/latest
    curl -sL \
      "$BASE_URL/wasi_preview1_component_adapter.reactor.wasm" \
      -o target/wasi_snapshot_preview1.wasm
  fi

  wasm-tools component new --adapt target/wasi_snapshot_preview1.wasm {{fruit}}/target/wasm32-wasi/release/{{fruit}}-opt.wasm > {{fruit}}-wasi.wasm

run fruit='banana': (build fruit)
  cargo run --release -- {{fruit}}-wasi.wasm
