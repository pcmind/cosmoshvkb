#!/bin/bash
set -e

echo "=== Initializing ZMK Workspace ==="
/bin/bash /workspaces/cosmoshvkb/.devcontainer/setup_workspace.sh

echo "=== Configuring Intellisense compilation database generation ==="
west config build.cmake-args -- -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

echo "=== Setup Complete! ==="
echo "You can now compile the firmware and draw the layout by running: ./build.sh unsplithk"
echo "The layout diagram will be automatically updated after a successful build."
