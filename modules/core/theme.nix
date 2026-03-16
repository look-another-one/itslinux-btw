{ pkgs, vars, ... }:

{
  stylix = {
    enable = true;
    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = vars.cursor.name;
      size = vars.cursor.size;
    };
  };
}