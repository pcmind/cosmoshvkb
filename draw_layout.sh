#!/bin/bash
# Exit on error
set -e

echo "Parsing ZMK keymap to YAML using Docker..."
docker run --rm -v "$(pwd):/keymap" ghcr.io/hnaderi/keymap-drawer -c /keymap/keymap_drawer.config.yaml parse -b /keymap/unsplithk.yaml -z /keymap/config/unsplithk.keymap > unsplithk.yaml.tmp && mv unsplithk.yaml.tmp unsplithk.yaml

echo "Generating and injecting custom curved physical layout coordinates..."
python3 generate_layout.py

echo "Generating vector SVG diagram using Docker..."
docker run --rm -v "$(pwd):/keymap" ghcr.io/hnaderi/keymap-drawer -c /keymap/keymap_drawer.config.yaml draw -j /keymap/unsplithk_info.json /keymap/unsplithk.yaml > unsplithk.svg

echo "Success! layout vector graphic generated at: unsplithk.svg"







