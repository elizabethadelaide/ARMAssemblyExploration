#!/bin/bash

strace -e execve,socket,bind,listen,accept,dup2 ./a.out 2>> straceout.txt


