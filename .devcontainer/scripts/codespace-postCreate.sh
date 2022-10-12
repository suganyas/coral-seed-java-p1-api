#!/bin/bash
set -euo pipefail
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sudo chown codespace -R ./.git/hooks

. "$SCRIPT_DIR/detect-secrets/init.sh"
. "$SCRIPT_DIR/cluster-create.sh"
. "$SCRIPT_DIR/cluster-runApp.sh"
