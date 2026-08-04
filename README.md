> [!WARNING]
> It's been 5 month using this config and i don't even have good understanding of nix, just because i use to write code with ai without understanding it. So i rewrite my whole config myself and this repo is ended.
> Check new [repo](https://github.com/look-another-one/itsnixos-btw)!


<div align="center">
  <h1>❄️ itslinux-btw Dotfiles</h1>
  <p>A modular, reproducible, and aesthetic NixOS configuration managed with Flakes and Home Manager.</p>
</div>

> [!WARNING]
> This is a personal NixOS configuration. Use it at your own risk; everything is hardcoded for my specific needs and hardware, and README is not uptodate.

</details>

## ✨ Features

- **OS**: [NixOS](https://nixos.org/) (Unstable, powered by [Lix](https://lix.systems/))
- **Management**: Nix Flakes & Home-Manager
- **Compositor**: [Niri](https://github.com/YaLTeR/niri) (Scrollable-tiling Wayland compositor) with [Noctalia](https://noctalia.dev)
- **Display Manager**: greetd
- **Theming**: Adwaita Dark GTK/QT theme with custom modules
- **Editors**: VSCodium & Neovim
- **Browsers**: Brave

## 🛠️ Tools & Applications

Here is a comprehensive list of the primary tools and utilities used in this configuration:

### Terminal & Shell
| Tool | Description |
| :--- | :--- |
| `kitty` | Terminal Emulator |
| `nushell`, `zsh` | Shell Environments |
| `starship` | Shell Prompt |

### Utilities & CLI
| Tool | Description |
| :--- | :--- |
| `nemo` | File Managers |
| `btop`, `fastfetch` | System Monitors |
| `git`, `lazygit` | Version Control |
| `bat`, `eza`, `unzip` | Command-line Utilities |
| `cava` | Audio Visualizer |
| `keyd` | Key Remapping |

### Desktop Environment
| Tool | Description |
| :--- | :--- |
| `noctalia` | Desktop Shell |

### GUI Applications
| Tool | Description |
| :--- | :--- |
| `obs-studio` | Screen Recorder/Broadcasting |
| `keepassxc` | Password Manager |
| `scrcpy`, `localsend` | Device Utilities |

### Development
| Tool | Description |
| :--- | :--- |
| `tailscale` | VPN & Mesh Network |
| `mysql` | Database System |
| `nodejs`, `python`, `C++` | Programming Languages |

## 📂 Repository Structure

The configuration is organized into a modular tree for easier maintainability:

```text
.
├── config/             # Application config dotfiles (configfiles, dotfiles, themes)
├── modules/            # The core of the modular setup
│   ├── core/           # System-level features (networking, boot, sddm, etc.)
│   ├── program/        # User-level apps (browser, cli, editor, dev, db, etc.)
│   └── packages/       # Additional standalone packages
├── nix/
│   ├── config/         # Global NixOS configuration files
│   ├── flake/          # Flake definition (inputs/outputs)
│   ├── home-men/       # Home Manager configuration
│   └── host/           # Host-specific variables
└── assets/             # Wallpapers and other static assets
```
