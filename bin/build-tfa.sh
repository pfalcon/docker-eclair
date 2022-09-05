#!/bin/sh
set -ex

export CROSS_COMPILE=/opt/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
cd ${WORKSPACE}/trusted-firmware-a
make PLAT=$1 clean
make PLAT=$1 ${MAKE_TARGET} -j3
