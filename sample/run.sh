#!/bin/bash

mkdir build/
set -e

cd build/
cmake ..
make

echo -e "run hello:"
./hello
echo -e "run sumArraysOnGPU:"
./sumArraysOnGPU-timer
echo -e "run cublas:"
./cublas
