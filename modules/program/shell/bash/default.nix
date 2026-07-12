# home.nix
{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    # -----------------------------------------------------
    # Aliases (General, Git, System, and eza)
    # -----------------------------------------------------
    shellAliases = {
      # General
      c = "clear";
      cat = "bat";
      fl = "fastfetch";
      ff = "fastfetch --logo None";
      v = "$EDITOR";
      btw = "echo \"i use nixos btw\"";
      ln = "nu -c \"ls $@\"";

      sts = "git status";
      push = "git push";
      pull = "git pull";
      cm = "git commit -m";
      add = "git add";

      nix-sw = "nh os switch";
      nix-boot = "nh os boot";
      update = "sudo nix flake update --flake \$\$FLAKE_DIR/nix/flake/flake.nix";

      ls = "eza --icons=always";
      lsa = "nu -c ls";
      la = "eza -a --icons=always";
      ll = "eza -al --icons=always";
      lt = "eza -a --tree --level=1 --icons=always";
    };
    initExtra = ''
      export EDITOR=nvim

      ENV_FILE="$HOME/.env"
      if [[ -f "$ENV_FILE" ]]; then
          set -a
          source "$ENV_FILE"
          set +a
      fi

      bind '"\C-h": backward-kill-word'

      eval "$(starship init bash)"
    '';
  };
}
