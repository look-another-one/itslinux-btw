{ pkgs, user, ... }:

{
  programs.nushell = {
    enable = true;

    shellAliases = {
      # General
      c         = "clear";
      cat       = "bat";
      fl        = "fastfetch";
      ff        = "fastfetch --logo None";
      ttc       = "tty-clock -s -c -C 4";
      btw       = ''echo "i use nixos btw"'';
      v        = "nvim";

      # Git
      sts  = "git status";
      push = "git push";
      pull = "git pull";
      cm   = "git commit -m";
      add  = "git add";

      # System
      nix-sw = "nh os switch ${user.flakeDirectory}/nix/flake";
      update = "nh os switch ${user.flakeDirectory}/nix/flake -- --recreate-lock-file";
      clean  = "nh clean all --keep 4";
    };
    extraConfig = ''
  $env.config.show_banner = false
  $env.config.buffer_editor = "nvim" 
  $env.config.keybindings ++= [{
    name: delete_one_word_backward
    modifier: control
    keycode: backspace
    mode: [emacs, vi_insert]
    event: { edit: backspaceword }
}]
	'';
  };
}
