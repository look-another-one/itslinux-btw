{ pkgs, vars, ... }:

let
  nodeVersion = "nodejs_${vars.languages.nodejs}";

  nodejs = pkgs.${nodeVersion};

in {

  environment.systemPackages = [
    nodejs        
    pkgs.yarn     
    pkgs.pnpm     
  ];
  environment.variables = {
    NODE_VERSION = nodeVersion;

    NPM_CONFIG_PREFIX = "$HOME/.npm-global";
  };
  environment.shellInit = ''
    export PATH="$HOME/.npm-global/bin:$PATH"
  '';
}
