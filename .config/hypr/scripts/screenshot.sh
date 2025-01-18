#!/bin/bash

TARGET_DIR="/run/media/whip/external drive/Screenshots/LinuxScreenshots"

mkdir -p "$TARGET_DIR"

RANDOM_STRING=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 20)

grim -g "$(slurp -d)" "$TARGET_DIR/$RANDOM_STRING.png" && wl-copy < "$TARGET_DIR/$RANDOM_STRING.png"
