# GEMINI.md

## Project Overview

This repository contains the files for a personal 38-key, un-split, hand-wired, wireless keyboard. The project includes:

*   **Keyboard Layout:** The physical layout of the keyboard is designed using [Ergogen](https://ergogen.xyz/) and defined in the `ergogen.yaml` file.
*   **Firmware:** The keyboard firmware is based on the [ZMK Firmware](https://zmk.dev/). The keymap is defined in the `config/` directory, with specific files for different keyboard variations (`cosmoshk.keymap` and `unsplithk.keymap`).
*   **Hardware:** The `boards/` directory contains the shield configurations for the custom keyboards, which are designed to be used with a `nice_nano_v2` controller. The `case/` directory contains STL files for 3D printing the keyboard case.

## Building and Running

The firmware is automatically built using GitHub Actions, as defined in `.github/workflows/build.yml` and `build.yaml`.

To build the firmware locally, you will need to set up the ZMK build environment by following the instructions in the [ZMK documentation](https://zmk.dev/docs/development/setup).

Once your environment is set up, you can build the firmware using the `west` tool. For example, to build the `unsplithk` firmware:

```bash
west build -d build/unsplithk -p -b nice_nano_v2 -- -DSHIELD=unsplithk
```

The compiled firmware will be located in the `build/unsplithk/zephyr/zmk.uf2` file.

## Development Conventions

*   **Keymaps:** Keymap configurations are located in the `config/` directory. The `.keymap` files use ZMK's keymap syntax.
*   **Boards and Shields:** Custom board and shield definitions are located in the `boards/` directory.
*   **Ergogen:** The `ergogen.yaml` file is used to generate the keyboard layout. Any changes to the physical layout of the keyboard should be made in this file.
*   **ZMK Configuration:** The ZMK configuration is split across several files, including the `.keymap` files, `.conf` files, and `.overlay` files in the shield directories.
