#!/bin/bash
# Exit on error
set -e

# Export persistent pip packages path to PATH and PYTHONPATH
export PATH="/workspaces/.pip-packages/bin:$PATH"
export PYTHONPATH="/workspaces/.pip-packages:$PYTHONPATH"

echo "=== Setting up workspace symlink ==="
cd /workspaces
if [ ! -L config ]; then ln -s cosmoshvkb config; fi

echo "=== Checking keymap-drawer ==="
if ! command -v keymap &> /dev/null; then
    echo "Installing keymap-drawer to persistent volume..."
    pip3 install --target=/workspaces/.pip-packages --no-cache-dir keymap-drawer
else
    echo "keymap-drawer is already installed."
fi

echo "=== Setting up West Configuration ==="
if [ ! -f ".west/config" ]; then
    mkdir -p .west
    cat <<EOF > .west/config
[manifest]
path = config
file = config/west.yml
EOF
    echo "West configuration created."
else
    echo "West configuration already exists."
fi

# Skip west update if ZMK and Zephyr directories are already present
if [ ! -d "zephyr" ] || [ ! -d "zmk" ]; then
    echo "=== Updating West Dependencies ==="
    echo "This may take a few minutes as it downloads Zephyr RTOS and ZMK..."
    west update
else
    echo "Zephyr and ZMK dependencies are already present. Skipping west update."
fi

echo "=== Exporting Zephyr ==="
west zephyr-export

