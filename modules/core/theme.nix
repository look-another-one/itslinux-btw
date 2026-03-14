{ pkgs, vars, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";

    # Pure OLED black base16 palette — no purple
    base16Scheme = {
      scheme = "Void Black";
      author = "yousaytoday";
      base00 = "000000"; # background (OLED black)
      base01 = "0d0d0d"; # lighter background
      base02 = "1a1a1a"; # selection background
      base03 = "2a2a2a"; # comments / disabled
      base04 = "505050"; # dark foreground
      base05 = "c0c0c0"; # default foreground
      base06 = "e0e0e0"; # light foreground
      base07 = "ffffff"; # white
      base08 = "cc4444"; # red — errors
      base09 = "e0956a"; # orange
      base0A = "d4c87a"; # yellow
      base0B = "7ab87a"; # green
      base0C = "6ab8c8"; # cyan
      base0D = "5a9fe0"; # blue — primary accent
      base0E = "7c6fa0"; # violet — kept muted
      base0F = "888888"; # deprecated/misc
    };

    cursor = {
      package = pkgs.adwaita-icon-theme;
      name = vars.cursor.name;
      size = vars.cursor.size;
    };
  };
}
