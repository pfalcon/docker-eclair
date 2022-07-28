FROM eclair-linaro-base

# Can be overriden at build time
ARG BUILDSLAVE_PASSWORD=buildslave
ENV ECLAIR_LICENSE_SERVER flexnet.trustedfirmware.org
ENV WORKSPACE "/home/buildslave/workspace/pfalcon-tf-a-eclair"

COPY gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz /tmp

USER root
RUN mkdir -p /opt
RUN tar -xaf /tmp/gcc-arm-11.2-2022.02-x86_64-aarch64-none-elf.tar.xz -C /opt
RUN rm -rf /var/hasplm/storage

RUN apt-get -y -q --no-install-recommends install \
    device-tree-compiler \
    git \
    nano \
    openjdk-8-jre-headless \
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
