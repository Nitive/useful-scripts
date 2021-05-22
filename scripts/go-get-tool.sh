#!/bin/bash

set -euo pipefail

# Warning! This file is supposed to be run from Makefile
# Usage:
#
# 1. Add to Makefile
# ```
# bin/controller-gen:
#   @ scripts/go-get-tool.sh sigs.k8s.io/controller-tools/cmd/controller-gen@v0.4.1
# ```
# 2. Run `make bin/controller-gen` or add it as dependency for another make target
# ```
# start: bin/controller-gen
#   # Before executing this line `make bin/controller-gen` will be automaticly run if file bin/controller-gen do not exists
# ```
#
# Version: 1.0.0
# Source: https://github.com/Nitive/useful-scripts/tree/scripts/go-get-tool.sh
# Changelog: https://github.com/Nitive/useful-scripts/commits/main/scripts/go-get-tool.sh

binDir="$(pwd)/bin"
module="$1"
tmpModuleDir="$(mktemp -d)"

cd "$tmpModuleDir"
go mod init tmp 2>/dev/null
echo "Downloading $module"
GOBIN="$binDir" go get "$module"
rm -rf "$tmpModuleDir"
