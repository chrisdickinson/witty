# something witty here

This is just a testbed for playing with WebAssembly interface types.

It's fruit-themed and alphabetically delicious!

## notes for future chris

Make sure you have installed:

- just
- wasm-tools (via bytecodealliance)
- binaryen (for wasm-opt)
- uh, rust and the wasm32-wasi toolchain

Also: I wrote this repo at almost the exact time a bunch of shifts in wasi-preview2 were going on, so... expect some bitrot, especially
around the preview1 adapter stuff.

Also note, to wasi:

- `reactor` means "library"
- `command` means "application"

## it's a two step!

The default `just` recipe takes a fruit to cook and produces a `<fruit>-wasi.wasm` in the current working directory.

`just run <fruit>` will run the main wasmtime program.
