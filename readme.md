# 🌌 Cosmos HK - Custom 38-Key Keyboard

![Cosmos HK Keyboard](case/unsplithk/top.jpg)

## 🗺️ Interactive Visual Keymap

![unsplithk Keyboard Layout](unsplithk.svg)

Welcome to the official repository for the **Cosmos HK (unsplithk)**—a personal, compact, un-split 38-key hand-wired wireless keyboard designed for maximum efficiency, ergonomics, and seamless compatibility with Portuguese (PT) operating system layouts.

Powered by [ZMK Firmware](https://zmk.dev/) running on a `nice_nano_v2` controller, this layout features home-row modifiers, tap-dance punctuation shortcuts, conditional layers, custom symbol macros, and localized ZMK behaviors.

---

## ✨ Key Features & Enhancements

*   **⚡ Tap-Dance Punctuation**: Standard punctuation keys double up as common symbols on a quick double-tap, eliminating the need for layer switches:
    *   `,` $\rightarrow$ `;` (Semicolon)
    *   `.` $\rightarrow$ `:` (Colon)
    *   `-` $\rightarrow$ `_` (Underscore)
*   **🔄 Home-Row Repeat Key**: ZMK's `&key_repeat` is placed at the physical **`U`** position on the Nav layer. Hold the Nav thumb (SPACE) and tap `U` to repeat the last pressed key or macro as many times as you like.
*   **🖱️ Native Mouse Layer (Tri-Layer)**: Hold both the **Nav** (Layer 1) and **Num** (Layer 2) thumb keys simultaneously to automatically trigger the **Mouse Layer** (Layer 3) with mouse pointer and scrolling movements.
*   **✍️ Localized `caps_word`**: Customized Portuguese continue-list including `PT_UNDERSCORE`, `PT_MINUS`, and `PT_SINGLE_QUOTE`. Typographical hyphens, underscores, or apostrophes (such as in *d'água*) will not deactivate `caps_word` capitalization.
*   **💎 Custom Symbol Macros**: Dedicated macro layer providing quick, delay-buffered access to Portuguese characters (`ã`, `õ`) and development symbols (`->`, `=>`, `==`, `!=`, `<=`, `>=`).
*   **🌐 Wireless Multi-Device Bluetooth**: Seamless profiles switching for up to 5 devices, built-in battery/power management, and automatic Bluetooth/USB output toggle.

---

## 🗺️ Keymap Layer Designs

Click on each layer below to expand the beautifully aligned and perfectly symmetrical physical keymap layout.

<details>
<summary><b>⌨️ Layer 0: Default Layer</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │   Q   │   W   │   E   │   R   │   T   │       │   Y   │   U   │   I   │   O   │   P   │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │  ESC  │ A/WIN │ S/ALT │ D/CTL │ F/SFT │   G   │       │   H   │ J/SFT │ K/CTL │ L/ALT │ Ç/GUI │  DEL  │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │   Z   │   X   │   C   │ V/MAC │   B   │       │   N   │   M   │  , / ;│  . / :│  - / _│
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │TAB/FUN│SPC/NAV│ENT/CTL│       │ENT/SYM│BSP/NUM│0/SHFT │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>🧭 Layer 1: Nav Layer (Navigation & Media)</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │ trans │PrevApp│NextApp│ trans │ WinL  │       │Cancel │REPEAT │ trans │ trans │ trans │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │  BSP  │  GUI  │  ALT  │ LCTRL │ LSHFT │ WinR  │       │ Caps  │ LEFT  │ DOWN  │  UP   │ RIGHT │  DEL  │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │ Undo  │  Cut  │ Copy  │ Paste │ Redo  │       │ Insert│ Home  │ PgDn  │ PgUp  │  End  │
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ trans │ trans │ trans │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>🔢 Layer 2: Num Layer (Numpad)</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │   ,   │   7   │   8   │   9   │   /   │       │ trans │ trans │ trans │ trans │ trans │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │ trans │   -   │   4   │   5   │   6   │   +   │       │ trans │ RSHFT │ RCTRL │ LALT  │ LGUI  │ trans │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │   =   │   1   │   2   │   3   │   *   │       │ trans │ trans │ trans │ RALT  │ trans │
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ trans │   0   │   .   │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>🖱️ Layer 3: Mouse Layer</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │ trans │ trans │Ctrl+E │ trans │ trans │       │ trans │  MB3  │ LCLK  │ RCLK  │ trans │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │  ESC  │Ctrl+A │ LALT  │ LCTRL │ LSHFT │ trans │       │ Menu  │MsLeft │MsDown │ MsUp  │MsRight│ trans │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │Ctrl+Z │Ctrl+X │Ctrl+C │Ctrl+V │C+S+Z  │       │ trans │ScLeft │ScDown │ ScUp  │ScRight│
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ trans │ trans │ trans │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>🎭 Layer 4: Sym Layer (Special Symbols)</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │   \   │   '   │   `   │   ´   │   /   │       │   º   │   ~   │   ^   │   ª   │   ª   │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │   €   │   |   │   *   │   &   │   ?   │   %   │       │ trans │ LSHFT │ RCTRL │ LALT  │ LGUI  │ trans │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │   @   │   !   │   "   │   #   │   $   │       │ trans │ trans │ trans │ RALT  │ trans │
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ trans │ trans │ trans │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>⚙️ Layer 5: Fun Layer (F1-F24 Keys)</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │  F12  │  F7   │  F8   │  F9   │ PRTSc │       │  F13  │  F14  │  F15  │  F16  │  F17  │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │ trans │F11/WIN│F4/ALT │F5/CTRL│F6/SHFT│  INS  │       │  F19  │F20/SFT│F21/CTL│F22/ALT│F23/GUI│ trans │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │  F10  │  F1   │  F2   │  F3   │ trans │       │  F24  │ trans │ trans │ trans │ trans │
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ none  │ none  │ trans │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

<details>
<summary><b>🚀 Layer 8: Macro Layer (Portuguese Shortcuts & Coding Operators)</b></summary>

```text
           ┌───────┬───────┬───────┬───────┬───────┐       ┌───────┬───────┬───────┬───────┬───────┐
           │ trans │ trans │ trans │ trans │ trans │       │ trans │ trans │ trans │   õ   │ trans │
   ┌───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┐
   │ trans │   ã   │ trans │ trans │ trans │ trans │       │  ~/   │  !=   │  ==   │  ->   │  =>   │ trans │
   └───────┼───────┼───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┼───────┼───────┼───────┘
           │ trans │ trans │ trans │ none  │ trans │       │ trans │ none  │  <=   │  >=   │ trans │
           └───────┴───────┼───────┼───────┼───────┤       ├───────┼───────┼───────┴───────┴───────┘
                           │ trans │ trans │ trans │       │ trans │ trans │ trans │
                           └───────┴───────┴───────┘       └───────┴───────┴───────┘
```
</details>

---

## 🛠️ ZMK Development Conventions

*   **Portuguese Key Mappings**: ZMK keymap standard uses Portuguese localized configurations from `keys_pt.h`. Standard US keycodes compile directly into their corresponding Portuguese OS positions (e.g. `SLASH` acts as `-`/`_`).
*   **Automatic Remote Builds**: Firmware builds are fully automated using GitHub Actions. Any commit pushed to the `master` branch will trigger `.github/workflows/build.yml` using `build.yaml` configurations.
*   **Local Build**:
    To set up the ZMK environment and build locally, please follow the [ZMK Developer Setup Instructions](https://zmk.dev/docs/development/setup), then compile with the `west` tool:
    ```bash
    west build -d build/unsplithk -p -b nice_nano_v2 -- -DSHIELD=unsplithk
    ```
    The compiled binary will be placed at `build/unsplithk/zephyr/zmk.uf2`.

---

*Handcrafted with ❤️ for maximum mechanical writing pleasure.*