#!/bin/bash


as execve.s -o execve.o && ld -N execve.o -o execve

objcopy -O binary execve execve.bin

hexdump -v -e '"\\""x" 1/1 "%02x" ""' execve.bin >> execve.hex
