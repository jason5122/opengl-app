#!/bin/bash

ninja -C out/arm64
ninja -C out/x86_64

rm -rf out/universal
mkdir -p out/universal

# https://chromium.googlesource.com/chromium/src/+/main/docs/mac_arm64.md#universal-builds
./scripts/universalizer.py \
  out/arm64/OpenGLApp.app \
  out/x86_64/OpenGLApp.app \
  out/universal/OpenGLApp.app
