<div align="center">
  <h1>❄️ itslinux-btw Dotfiles</h1>
  <p>A modular, reproducible, and aesthetic NixOS configuration managed with Flakes and Home Manager.</p>
</div>

> [!WARNING]
> This is a personal NixOS configuration. Use it at your own risk; everything is hardcoded for my specific needs and hardware.

## ✨ Features

- **OS**: [NixOS](https://nixos.org/) (Unstable)
- **Management**: Flakes & Home-Manager
- **Compositor**: [Niri](https://github.com/YaLTeR/niri) (Scrollable-tiling Wayland compositor)
- **Display Manager**: SDDM
- **Theming**: [Stylix](https://github.com/danth/stylix) (Adwaita Dark preset)
- **Editors**: VSCodium & Neovim
- **Browsers**: Zen Browser & Brave
- **CLI/TUI Utilities**:

| Tool | Description |
| :--- | :--- |
| `yazi` | File Manager |
| `zellij` | Terminal Multiplexer |
| `btop` | System Monitor |
| `fastfetch` | System Info |
| `rofi` | App Launcher |
| `swaync` | Notification Center |

## 📂 Repository Structure

The configuration is organized into a modular tree for easier maintainability:

```text
.
├── config/             # Global NixOS configuration files
├── modules/            # The core of the modular setup
│   ├── core/           # System-level features (audio, boot, networking, sddm, zram, etc.)
│   └── program/        # User-level apps grouped by category (browser, cli, editor, media)
├── nix/
│   ├── flake/          # Flake definition (inputs/outputs)
│   ├── home-men/       # Home Manager setup
│   └── host/           # Host-specific variables (variable.nix)
└── assets/             # Wallpapers and other static assets
```
