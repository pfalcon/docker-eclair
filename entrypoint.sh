#!/bin/sh

set -ex

echo $1

forwardPorts && \
postStart

sudo /usr/sbin/setup-sshd $1
bash
