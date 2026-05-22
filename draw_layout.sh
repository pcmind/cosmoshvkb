#!/bin/bash
# Exit on error
set -e

echo "Parsing ZMK keymap to YAML using Docker..."
docker run --rm -v "$(pwd):/keymap" ghcr.io/hnaderi/keymap-drawer -c /keymap/keymap_drawer.config.yaml parse -z /keymap/config/unsplithk.keymap > unsplithk.yaml

echo "Injecting custom physical layout definition (cols_thumbs_notation)..."
python3 -c "
with open('unsplithk.yaml', 'r') as f:
    content = f.read()
if 'layout:' not in content:
    content = 'layout: {cols_thumbs_notation: \"133333+3 3+333331\"}\n' + content
else:
    content = content.replace('zmk_keyboard: unsplithk', 'cols_thumbs_notation: \"133333+3 3+333331\"')
with open('unsplithk.yaml', 'w') as f:
    f.write(content)
"

echo "Generating vector SVG diagram using Docker..."
docker run --rm -v "$(pwd):/keymap" ghcr.io/hnaderi/keymap-drawer -c /keymap/keymap_drawer.config.yaml draw /keymap/unsplithk.yaml > unsplithk.svg

echo "Success! layout vector graphic generated at: unsplithk.svg"
