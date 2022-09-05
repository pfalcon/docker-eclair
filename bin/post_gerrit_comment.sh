#!/bin/bash
#
# Copyright (c) 2019-2020, Arm Limited. All rights reserved.
#
# SPDX-License-Identifier: BSD-3-Clause
#
set -ex

should_post_comment=0

if echo "${GERRIT_PROJECT}" | grep -q sandbox; then
    should_post_comment=1
fi

if [ $should_post_comment -eq 1 ]; then
    mkdir -p ~/.ssh/
    ssh-keyscan -H -p 29418 $GERRIT_HOST >> ~/.ssh/known_hosts
    ssh -vvvv -p 29418 -i "$CI_BOT_KEY" "$CI_BOT_USERNAME@$GERRIT_HOST" gerrit \
        review  "$GERRIT_CHANGE_NUMBER,$GERRIT_PATCHSET_NUMBER" \
        --message "'$(cat misra_delta.txt)'"
fi
