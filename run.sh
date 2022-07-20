export HASPLM_PORT=1946
export ECLAIR_PORT=3785

docker run -it \
       -p "${HASPLM_PORT}:${HASPLM_PORT}" \
       -p 2222:22 \
       -e HASPLM_PORT \
       -e ECLAIR_PORT \
       -v "$PWD/../trusted-firmware-a:/workspace/trusted-firmware-a" \
       -it --rm eclair-linaro-tfa
