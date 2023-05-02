#!/bin/bash

set -e
BRANCH=master
# import VERSION from one of the google internal CLs
VERSION=master
GIT_REPO="https://github.com/ShobhitTripathi/grpc_proto.git"
GIT_BASE_DIR=grpc_proto
SOURCE_PROTO_BASE_DIR=grpc_proto/proto
TARGET_PROTO_BASE_DIR=proto
FILES=(
# DEPENDENCY_PROTO_FILES
#proto/chat/v1/chat.proto

# PROTO_FILES
chat/v1/chat.proto
)

tmpdir="$(mktemp -d)"
pushd "${tmpdir}"
rm -rf $GIT_BASE_DIR
git clone $GIT_REPO
cd "$GIT_BASE_DIR"
#git checkout $VERSION
popd

rm -rf "${TARGET_PROTO_BASE_DIR}"
mkdir -p "${TARGET_PROTO_BASE_DIR}"
pushd "${TARGET_PROTO_BASE_DIR}"

for file in "${FILES[@]}"
do
  mkdir -p "$(dirname "${file}")"
  cp -p "${tmpdir}/${SOURCE_PROTO_BASE_DIR}/${file}" "${file}"
done
popd

rm -rf "$tmpdir"