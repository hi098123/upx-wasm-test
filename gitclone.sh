#!/usr/bin/env bash

REPO="https://github.com/upx/upx"
UPX_DIR="upx"
UPX_VERSION=$(git ls-remote --tags --refs $REPO | tail -n1 | cut -d/ -f3)

git clone --recursive -b $UPX_VERSION $REPO $UPX_DIR
