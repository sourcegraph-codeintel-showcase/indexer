#!/usr/bin/env bash

OUTPUT=`mktemp -d -t sgdockerbuild_XXXXXXX`
cleanup() {
    rm -rf "$OUTPUT"
}
trap cleanup EXIT

# TODO - add to build agent instead
go get github.com/sourcegraph/lsif-go/cmd/lsif-go
go get github.com/sourcegraph/src-cli/cmd/src

git clone $1 $OUTPUT
cd $OUTPUT
lsif-go
src lsif upload
