#!/usr/bin/env bash

set -ex

src version
lsif-go --version

OUTPUT=`mktemp -d -t sgdockerbuild_XXXXXXX`
cleanup() {
    rm -rf "$OUTPUT"
}
trap cleanup EXIT

git clone "https://$1.git" "$OUTPUT"
cd "$OUTPUT"
lsif-go
src lsif upload
