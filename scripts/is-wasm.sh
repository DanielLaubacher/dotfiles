#!/bin/bash

if hexdump -C $1 | head -n1 | grep -q "00000000  00 61 73 6d"; then
  echo 1
else
  echo 0
fi

