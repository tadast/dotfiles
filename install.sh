#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

export UPGRADE="no"
export LOG_FILE=$(mktemp)

function write-log {
  if [[ $? -gt 0 ]]; then
    echo "Install failed. Logs are here: $LOG_FILE"
  fi
}
trap write-log EXIT

for app in $(ls apps); do
  PREVIOUS_PWD="$(pwd)"
  cd $(mktemp -d)
  echo "Installing $app..."
  $PREVIOUS_PWD/apps/$app >> "$LOG_FILE" 2>&1
  cd "$PREVIOUS_PWD"
done
