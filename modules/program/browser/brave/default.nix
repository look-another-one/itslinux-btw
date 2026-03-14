{ pkgs, ... }:

{
  home.packages = [ pkgs.brave ];

  xdg.configFile."brave/policies/managed/extensions.json".text = builtins.toJSON {
    ExtensionInstallForcelist = [
      "cjpalhdlnbpafiamejdnhcphjbkeiagm;https://clients2.google.com/service/update2/crx" # uBlock Origin
      "nngceckbapebfimnlniiiahkandclblb;https://clients2.google.com/service/update2/crx" # Bitwarden
      # "EXTENSION_ID;https://clients2.google.com/service/update2/crx"                   # add more here
    ];
  };
}
