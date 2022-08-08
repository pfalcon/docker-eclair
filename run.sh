export HASPLM_PORT=1946
export ECLAIR_PORT=3785

docker run -it \
       -p "${HASPLM_PORT}:${HASPLM_PORT}" \
       -p 2222:22 \
       -e HASPLM_PORT \
       -e ECLAIR_PORT \
       -v "$PWD/../trusted-firmware-a:/home/buildslave/workspace/pfalcon-tf-a-eclair/trusted-firmware-a" \
       -it --rm 987685672616.dkr.ecr.us-east-1.amazonaws.com/misra:eclair-linaro-tfa $1
