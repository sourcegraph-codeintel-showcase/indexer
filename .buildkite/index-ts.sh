#!/usr/bin/env bash

set -ex

OUTPUT=`mktemp -d -t sgdockerbuild_XXXXXXX`
cleanup() {
    rm -rf "$OUTPUT"
}
trap cleanup EXIT

git clone "https://$1.git" "$OUTPUT"
cd "$OUTPUT"
lsif-tsc -p .
SRC_ACCESS_TOKEN=$CODE_INTEL_SHOWCASE_SOURCEGRAPH_ACCESS_TOKEN src lsif upload
