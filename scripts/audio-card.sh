#!/bin/bash

    1 hexdump -C http.wasm | head -n1 | grep "00 61 73 6d 0a 00 00 00" # wasm component¬
  6   hexdump -C http.wasm | head -n1 | grep "00 61 73 6d 01 00 00 00" # regular wasm¬
is_wasm() {
  hexdump -C $1 | head -n1 | grep "00000000  00 61 73 6d"
}
