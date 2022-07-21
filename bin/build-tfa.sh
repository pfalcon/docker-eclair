#!/bin/sh
set -ex

export CROSS_COMPILE=/opt/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf/bin/aarch64-none-elf-
cd /home/buildslave/workspace/pfalcon-tf-a-priv/trusted-firmware-a
make PLAT=fvp clean
make PLAT=fvp bl1 -j3
