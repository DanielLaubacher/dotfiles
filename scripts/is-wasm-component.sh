#!/bin/bash

if hexdump -C $1 | head -n1 | grep "00 61 73 6d 0a 00 00 00"; then
  echo 1
else
  echo 0
fi
