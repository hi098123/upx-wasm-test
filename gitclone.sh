#!/usr/bin/env bash

UPX_DIR="upx"
UPX_VERSION="v4.0.2"

git clone -b $UPX_VERSION https://github.com/upx/upx $UPX_DIR
git --git-dir=$UPX_DIR/.git --work-tree=$UPX_DIR checkout $UPX_VERSION
cd $UPX_DIR
git submodule update --init
