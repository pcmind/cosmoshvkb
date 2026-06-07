#!/bin/bash
# Exit on error
set -e

# Help message
show_help() {
    echo "Usage: ./build.sh [shield_name]"
    echo "Available shields:"
    echo "  - unsplithk"
    echo "  - settings_reset"
    echo "  - all (builds all shields)"
}

# Check if shield name is provided
if [ -z "$1" ]; then
    show_help
    exit 1
fi

SHIELD=$1

# Export ZEPHYR_BASE so CMake can locate Zephyr package configurations
export ZEPHYR_BASE="/workspaces/zephyr"

# Ensure we are running inside the ZMK workspace
if [ ! -d "../zmk" ]; then
    echo "Error: ZMK source directory '../zmk' not found."
    echo "Make sure you are running this script inside the devcontainer."
    exit 1
fi

draw_layout() {
    echo "=============================================="
    echo "Drawing layout for unsplithk..."
    echo "=============================================="
    
    # Export persistent pip packages path to PATH and PYTHONPATH
    export PATH="/workspaces/.pip-packages/bin:$PATH"
    export PYTHONPATH="/workspaces/.pip-packages:$PYTHONPATH"
    
    # Ensure keymap-drawer is installed
    if ! command -v keymap &> /dev/null; then
        echo "Installing keymap-drawer using pip..."
        pip3 install --target=/workspaces/.pip-packages --no-cache-dir keymap-drawer
    fi
    
    echo "Parsing ZMK keymap to YAML..."
    keymap -c keymap_drawer.config.yaml parse -b unsplithk.yaml -z config/unsplithk.keymap > unsplithk.yaml.tmp && mv unsplithk.yaml.tmp unsplithk.yaml

    echo "Generating and injecting custom curved physical layout coordinates..."
    python3 generate_layout.py

    echo "Generating vector SVG diagram..."
    keymap -c keymap_drawer.config.yaml draw -j unsplithk_info.json unsplithk.yaml > unsplithk.svg

    echo "Success! Layout vector graphic generated at: unsplithk.svg"
}


build_shield() {
    local shield=$1
    echo "=============================================="
    echo "Building shield: $shield"
    echo "=============================================="
    west build -s ../zmk/app -d build/"$shield" -p -b nice_nano_v2 -- -DSHIELD="$shield" -DZMK_CONFIG="/workspaces/cosmoshvkb/config"
    echo "Build successful for $shield!"
    echo "Output firmware: build/$shield/zephyr/zmk.uf2"
    
    if [ "$shield" = "unsplithk" ]; then
        draw_layout
    fi
}

if [ "$SHIELD" = "all" ]; then
    build_shield "settings_reset"
    build_shield "unsplithk"
else
    # Validate shield name
    case "$SHIELD" in
        unsplithk|settings_reset)
            build_shield "$SHIELD"
            ;;
        *)
            echo "Error: Invalid shield name '$SHIELD'"
            show_help
            exit 1
            ;;
    esac
fi
