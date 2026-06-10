#!/bin/bash
set -v # verbose, but don't expand vars
echo 'export PATH="/usr/lib/ccache:$PATH"' | tee -a "/home/${USERNAME}/.bashrc"
echo 'export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp' >> "/home/${USERNAME}/.bashrc"
echo 'export CYCLONEDDS_URI=file:///workspaces/ros2_concrete_block_ws/.devcontainer/cyclonedds.xml' >> "/home/${USERNAME}/.bashrc"
echo 'export ROS_DOMAIN_ID=42' >> "/home/${USERNAME}/.bashrc"
echo 'export CCACHE_DIR=/workspaces/ros2_concrete_block_ws/.cache/ccache' >> "/home/${USERNAME}/.bashrc"
echo "source /usr/share/gazebo/setup.sh" >>"/home/${USERNAME}/.bashrc"
echo "source /opt/ros/humble/setup.bash" >>"/home/${USERNAME}/.bashrc"
echo "source /workspaces/ros2_concrete_block_ws/install/setup.bash" >>"/home/${USERNAME}/.bashrc"
echo "alias openlog='code log/latest_test/*/stdout_stderr.log'" >> /home/${USERNAME}/.bashrc
sudo npm install -g git-removed-branches
echo "alias gitprune='git fetch --prune fork && git fetch --prune origin && git removed-branches --prune --force -r fork && git removed-branches --prune --force -r fork'" >>~/.bashrc
# the meshes could be LFS objects
git lfs install
# user was not created in docker file yet
sudo addgroup kvm &&
  sudo usermod -aG 104 ${USERNAME} &&
  sudo usermod -aG video ${USERNAME} &&
  sudo usermod -aG dialout ${USERNAME} &&
  sudo usermod -aG kvm ${USERNAME} # joystick
# update global git settings
echo "*.pyc" >> /home/${USERNAME}/.gitignore
echo "*__pycache__*" >> /home/${USERNAME}/.gitignore
git config --global core.excludesFile '/home/${USERNAME}/.gitignore'
# defaults for colcon mixins, again for vscode user
colcon mixin add default \
  https://raw.githubusercontent.com/colcon/colcon-mixin-repository/master/index.yaml &&
  colcon mixin update &&
  colcon metadata add default \
    https://raw.githubusercontent.com/colcon/colcon-metadata-repository/master/index.yaml &&
  colcon metadata update
mkdir -p /home/${USERNAME}/.colcon && cp .devcontainer/defaults.yaml /home/${USERNAME}/.colcon
rosdep update --rosdistro=$ROS_DISTRO
sudo apt-get update
# Ensure Navigation2 BT packages are present even if the base image is stale or cached.
sudo apt-get install -y --no-install-recommends \
  ros-humble-nav2-behavior-tree \
  ros-humble-nav2-lifecycle-manager
# check out all repos listed in the meta-package's .repos file
vcs import src < src/concrete_block_stack/concrete_block_stack.repos
# initialise git submodules in every checked-out package; fall back to --remote
# if the pinned commit no longer exists on the remote (e.g. after a force-push)
for dir in src/*/; do
  if [ -f "$dir/.gitmodules" ]; then
    git -C "$dir" submodule update --init --recursive 2>/dev/null || \
      git -C "$dir" submodule update --init --recursive --remote
  fi
done
# update dependencies
rosdep install -riys --from-paths src
# install pre-commit hooks in each package
for dir in src/*/; do
  if [ -f "$dir/.pre-commit-config.yaml" ]; then
    (cd "$dir" && pre-commit install)
  fi
done
