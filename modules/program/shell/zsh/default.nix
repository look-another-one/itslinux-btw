{ config, pkgs, user, ... }:

{
  programs.zsh.enable = true;

  home-manager.users.${user.username} = {
    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      initContent = ''
        # -----------------------------------------------------
        # Variables
        # -----------------------------------------------------
        export FLAKE_DIR="${user.flakeDirectory}"
        export EDITOR=nvim

        # -----------------------------------------------------
        # Environment
        # -----------------------------------------------------
        ENV_FILE="$HOME/.env"

        if [[ -f "$ENV_FILE" ]]; then
          set -a
          source "$ENV_FILE"
          set +a
        fi

        # -----------------------------------------------------
        # Theme
        # -----------------------------------------------------
        eval "$(starship init zsh)"

        # -----------------------------------------------------
        # Aliases
        # -----------------------------------------------------

        alias ls="eza --icons=always"
        alias lsa="nu -c ls"
        alias la='eza -a --icons=always'
        alias ll='eza -al --icons=always'
        alias lt='eza -a --tree --level=1 --icons=always'

        alias c='clear'
        alias cat='bat'
        alias fl='fastfetch'
        alias ff='fastfetch --logo None'
        alias shutdown='systemctl poweroff'
        alias v='$EDITOR'
        alias ttc='tty-clock -s -c -C 4'
        alias btw='echo "i use nixos btw"'
        alias ln='nu -c "ls $@"'

        alias sts='git status'
        alias push='git push'
        alias pull='git pull'
        alias cm='git commit -m'
        alias add='git add'

        alias nix-sw='nh os switch'
        alias nix-boot='nh os boot'
        alias update='sudo nix flake update --flake $FLAKE_DIR/nix/flake/flake.nix'

        # -----------------------------------------------------
        # Keybinds
        # -----------------------------------------------------
        bindkey '^H' backward-kill-word
      '';
    };
  };
}