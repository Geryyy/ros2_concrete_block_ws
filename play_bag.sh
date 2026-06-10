#!/bin/bash
set -e


BAG_DIR="/home/vscode/Documents/pzs_crane_1_pickup"
RATE="${1:-1.0}"

ros2 bag play "$BAG_DIR" --rate "$RATE" --clock
