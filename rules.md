# 📜 itslinux-btw Dotfiles: Rules & Conventions

This document outlines the rules, style guide, design principles, and organizational conventions used in this NixOS configuration repository. Following these rules ensures the configuration remains clean, modular, and maintainable.

## 📂 1. Directory Organization

The repository is strictly structured to separate system configurations, user programs, raw dotfiles, and variables.

*   **`modules/` (The Core):** This is where declarative Nix configurations for individual components reside.
    *   `core/`: System-level configurations (e.g., networking, boot, sddm, hardware).
    *   `program/`: User-level applications, strictly categorized by domain (e.g., `browser/`, `cli/`, `editor/`, `dev/`, `media/`, `shell/`).
    *   `packages/`: Standalone, custom-built Nix packages.
*   **`config/` (Raw Dotfiles):** Contains native application configuration files (TOML, JSON, Lua, raw dotfiles). Do **not** put Nix expressions here. Subdirectories include `configfiles/` and `themes/`.
*   **`nix/` (NixOS/HM Entry & Globals):**
    *   `flake/`: Flake definition (`flake.nix` and `flake.lock`).
    *   `home-men/`: Home Manager entry points (`home.nix`, `default_apps.nix`).
    *   `host/`: Host-specific and user-specific variables (`user.nix`, `variable.nix`).
    *   `config/`: Global/System-wide NixOS configurations.
*   **`assets/`:** Static assets like wallpapers, avatars, and media.

## 📐 2. Style & Design Principles

*   **Modularity & Separation of Concerns:** Avoid monolithic configuration files. For complex applications (e.g., VSCodium, Neovim, Shells), split the configuration into logical chunks.
    *   *Example:* `modules/program/editor/vscodium/` should contain `default.nix` (the entry module), `settings.nix` (editor settings), and `extensions.nix` (plugins).
*   **Raw Configs vs. Nix Modules:** 
    *   Use Home Manager/NixOS module options when they provide a clean, declarative interface.
    *   If a tool's Nix module is too restrictive, cumbersome, or if you want to reuse an existing massive config, place the native config file in `config/configfiles/<app>` and symlink it via Home Manager (`xdg.configFile."<app>".source = ...;`).
*   **Variables over Hardcoding:** Do not hardcode usernames, home directories, or common paths. Always use the provided variable objects (`user`, `vars`) passed down from the flake inputs.
    *   *Good:* `home.username = user.username;`
    *   *Good:* `export FLAKE_DIR="${user.flakeDirectory}"`
    *   *Bad:* `home.username = "humenbeing";`
*   **Aesthetics & Theming:** The system adheres to a unified dark theme.
    *   **Theme:** Adwaita Dark (via `adw-gtk3-dark` and `adwaita-qt`).
    *   **Icons:** Papirus-Dark.
    *   **Cursor:** Bibata-Modern-Classic.
    *   Ensure any new GUI application respects these theme settings. Declare theming centrally in `nix/home-men/home.nix` under `gtk` and `qt` scopes to maintain consistency across Wayland/X11 apps.

## ✍️ 3. Coding Conventions (Nix)

*   **Imports:** When importing modules into `home.nix` or system configurations, use relative paths to make the module dependencies explicit.
    *   *Example:* `../../modules/program/cli/starship/default.nix`
*   **Formatting:** Maintain consistent indentation (usually 2 spaces for Nix files).
*   **Function Signatures:** Always include `...` in module argument lists (e.g., `{ config, pkgs, inputs, ... }:`) to prevent errors if the upstream flake passes new arguments.

## 🚀 4. Workflow

*   Whenever you add a new program, first determine its category (e.g., `cli`). 
*   Create its folder in `modules/program/<category>/<app-name>/`.
*   Create a `default.nix` for it, defining its `programs.<app>.enable = true;`.
*   If it needs a native config file, put it in `config/configfiles/<app-name>/` and link it in the `default.nix` or `home.nix`.
*   Finally, import the new module into `nix/home-men/home.nix` (for user apps) or `nix/config/...` (for system apps).
