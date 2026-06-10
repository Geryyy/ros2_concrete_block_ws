#!/bin/bash
# Check if host system is Windows, and if so, set the DISPLAY variable differently
if nslookup host.docker.internal >/dev/null 2>&1; then
  echo "export DISPLAY=\"\$(host host.docker.internal | awk '/has address/ { print \$4 ; exit }'):0.0\"" >>"/home/vscode/.bashrc"
fi
