{ config, pkgs, vars, ... }:

let
  javaVersion = vars.languages.java;
  jdk = pkgs."jdk${javaVersion}";
in {
  environment.systemPackages = [
    jdk
  ];
}
