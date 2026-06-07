#!/bin/bash
# Exit on error
set -e

# Help message
show_help() {
    echo "Usage: ./build_docker.sh [shield_name]"
    echo "Available shields:"
    echo "  - unsplithk"
    echo "  - settings_reset"
    echo "  - all"
}

if [ -z "$1" ]; then
    show_help
    exit 1
fi

SHIELD=$1

# Create the persistent cache volume if it doesn't exist
docker volume create zmk-workspace-cache > /dev/null

echo "Running ZMK build container..."
docker run --rm -it \
  --security-opt seccomp=unconfined \
  -v "zmk-workspace-cache:/workspaces" \
  -v "$(pwd):/workspaces/cosmoshvkb" \
  -w /workspaces \
  docker.io/zmkfirmware/zmk-dev-arm:3.5 \
  /bin/bash -c "
    trap 'chown -R $(id -u):$(id -g) /workspaces/cosmoshvkb' EXIT
    /bin/bash /workspaces/cosmoshvkb/.devcontainer/setup_workspace.sh
    echo '=== Building Shield ==='
    cd cosmoshvkb
    ./build.sh \"$SHIELD\"
  "

