#!/usr/bin/env bash

set -ex

for repo in "$@"; do
    OUTPUT=`mktemp -d -t sgdockerbuild_XXXXXXX`
    cleanup() {
        rm -rf "$OUTPUT"
    }
    trap cleanup EXIT

    git clone "https://$repo.git" "$OUTPUT"
    cd "$OUTPUT"
    lsif-tsc -p .
    SRC_ACCESS_TOKEN=$CODE_INTEL_SHOWCASE_SOURCEGRAPH_ACCESS_TOKEN src lsif upload
done
