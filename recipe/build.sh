#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

if [[ "${host_platform}" == "linux-riscv64" ]]; then
  go build -trimpath \
    -o="${PREFIX}/bin/rush" \
    -ldflags="-s -w -X main.Version=${PKG_VERSION}"
else
  go build -buildmode=pie -trimpath \
    -o="${PREFIX}/bin/rush" \
    -ldflags="-s -w -X main.Version=${PKG_VERSION}"
fi
go-licenses save . --save_path=license-files --ignore github.com/cznic/sortutil
