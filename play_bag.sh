#!/bin/bash
set -e


# BAG_DIR="/home/vscode/Documents/old/pzs_crane_1_pickup"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_2_placement_rotated"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_3_pickup_rotated"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_4_placement_far"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_5_stacking"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_6_stacking_rotated"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_7_palettes"
# BAG_DIR="/home/vscode/Documents/old/pzs_crane_8_palettes"



# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_bottom"
# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_top"
# BAG_DIR="/home/vscode/Documents/2026-07-07-pickup"
# BAG_DIR="/home/vscode/Documents/2026-07-07-pre_stack"           
# BAG_DIR="/home/vscode/Documents/2026-07-07-static"           
# BAG_DIR="/home/vscode/Documents/2026-07-07-wall3"
# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_bottom_no_sides"
# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_top_rotated"
# BAG_DIR="/home/vscode/Documents/2026-07-07-pickup_and_stack_rotated" # disassemble
# BAG_DIR="/home/vscode/Documents/2026-07-07-stacked" # --> refine problematic
# BAG_DIR="/home/vscode/Documents/2026-07-07-static_occluded"
# BAG_DIR="/home/vscode/Documents/2026-07-07-wet"
# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_bottom_no_sides_high"
BAG_DIR="/home/vscode/Documents/2026-07-07-misaligned_stack" # --> guter test für refine
# BAG_DIR="/home/vscode/Documents/2026-07-07-pickup_and_stack_rotated2" # grasp event
# BAG_DIR="/home/vscode/Documents/2026-07-07-stacked_no_gripper"
# BAG_DIR="/home/vscode/Documents/2026-07-07-wall"
# BAG_DIR="/home/vscode/Documents/2026-07-07-grip_at_bottom_rotated"
# BAG_DIR="/home/vscode/Documents/2026-07-07-partially_wet"
# BAG_DIR="/home/vscode/Documents/2026-07-07-pickup_and_stack_rotated3"
# BAG_DIR="/home/vscode/Documents/2026-07-07-stacking" # stack rotated
# BAG_DIR="/home/vscode/Documents/2026-07-07-wall2"        

RATE="${1:-1.0}"

ros2 bag play "$BAG_DIR" --rate "$RATE" --clock