#!/bin/sh

if [ ! -e gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz ]; then
    echo "Going to download gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz. Press Enter"
    read dummy
    wget https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz
fi

docker build -t 987685672616.dkr.ecr.us-east-1.amazonaws.com/misra:eclair-linaro-tfa .
