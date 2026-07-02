#!/bin/bash
set -e


# BAG_DIR="/home/vscode/Documents/pzs_crane_1_pickup"
BAG_DIR="/home/vscode/Documents/pzs_crane_2_placement_rotated"
# BAG_DIR="/home/vscode/Documents/pzs_crane_3_pickup_rotated"
# BAG_DIR="/home/vscode/Documents/pzs_crane_4_placement_far"
# BAG_DIR="/home/vscode/Documents/pzs_crane_5_stacking"
# BAG_DIR="/home/vscode/Documents/pzs_crane_6_stacking_rotated"
# BAG_DIR="/home/vscode/Documents/pzs_crane_7_palettes"
# BAG_DIR="/home/vscode/Documents/pzs_crane_8_palettes"
RATE="${1:-1.0}"

ros2 bag play "$BAG_DIR" --rate "$RATE" --clock
