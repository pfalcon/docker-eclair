#
# Copyright (c) 2021-2022 BUGSENG srl. All rights reserved.
# Copyright (c) 2022 Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause

FROM ubuntu:22.04

ARG EclairVersion=3.12.0
ARG EclairVariant=MC23P1-l64P

ENV ECLAIR_LICENSE_SERVER flexnet.trustedfirmware.org
ENV ECLAIR_LICENSE_USER unguessable

ARG SentinelVersion=8.23.1

ARG SetupDir=/tmp/eclair-${EclairVersion}-${EclairVariant}
ARG SetupFile=ECLAIR_${EclairVersion}-${EclairVariant}_Setup.run

ENV ECLAIR_TOP_DIR /opt/bugseng/eclair-${EclairVersion}
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

COPY ${SetupFile} /tmp

RUN apt-get update

RUN apt-get install -y -q tzdata && \
    ln -fs /usr/share/zoneinfo/Europe/Rome /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y -q install xz-utils apt-utils socat

RUN cd /tmp && \
    ./${SetupFile} --keep --noexec

RUN cd /tmp && \
    tar xzf "${SetupDir}/reqs/Sentinel_LDK_RTE/aksusbd-${SentinelVersion}.tar.gz" && \
    cd aksusbd-${SentinelVersion} && \
    ./dinst && \
    cd .. && \
    rm -rf aksusbd-${SentinelVersion}

RUN cd ${SetupDir} && \
    mkdir -m 755 -p "${ECLAIR_TOP_DIR}" && \
    mv * "${ECLAIR_TOP_DIR}" && \
    cd "${ECLAIR_TOP_DIR}/.." && \
    ln -sf "$(basename "${ECLAIR_TOP_DIR}")" eclair && \
    "${ECLAIR_TOP_DIR}/bin/postinstall.sh"

RUN rm -rf ${SetupDir} && \
    rm -rf /tmp/${SetupFile}

ENV PATH ${PATH}:${ECLAIR_TOP_DIR}/../bin:${ECLAIR_TOP_DIR}/bin

RUN apt-get install -y -q sudo && \
    useradd -m eclair -s /bin/bash && \
    echo "eclair ALL=NOPASSWD: ALL" > /etc/sudoers.d/eclair


# Can be overriden at build time
ARG BUILDSLAVE_PASSWORD=buildslave
ENV ECLAIR_LICENSE_SERVER flexnet.trustedfirmware.org
ENV WORKSPACE "/home/buildslave/workspace/pfalcon-tf-a-eclair"

COPY gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz /tmp

RUN mkdir -p /opt
RUN tar -xaf /tmp/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz -C /opt
RUN rm -rf /var/hasplm/storage

RUN apt-get update && \
    apt-get -y -q --no-install-recommends install \
    device-tree-compiler \
    git \
    nano \
    openjdk-11-jre-headless \
    openssh-server \
    python3

COPY tf-*.install /tmp/
COPY setup-sshd /usr/sbin/setup-sshd
COPY entrypoint.sh /usr/sbin/entrypoint.sh

RUN set -e ;\
   # Setup buildslave user for Jenkins
    useradd -m -s /bin/bash buildslave ;\
    echo "buildslave:$BUILDSLAVE_PASSWORD" | chpasswd ;\
    echo 'buildslave ALL = NOPASSWD: ALL' > /etc/sudoers.d/jenkins ;\
    chmod 0440 /etc/sudoers.d/jenkins ;\
    mkdir -p /var/run/sshd ;\
    bash -ex /tmp/tf-environment.install


USER eclair

COPY bin/ /opt/bugseng/bin

EXPOSE 22

ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
