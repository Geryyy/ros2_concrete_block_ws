# ros2_concrete_block_ws

Top-level ROS 2 workspace and devcontainer setup for the concrete block stack.

## Fresh Checkout

Clone this repository and open it in the VS Code devcontainer. The devcontainer
post-create hook imports all package repositories from the top-level
`ros.repos` file:

```bash
vcs import src < ros.repos
```

No manual copy of a `.repos` file into `src/` is required. The older
package-local manifest remains in `src/concrete_block_stack/` for package
documentation, but `ros.repos` is the bootstrap manifest for this workspace.

After the container has been created, build from the workspace root:

```bash
colcon build
source install/setup.bash
```
