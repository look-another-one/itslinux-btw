{ pkgs, vars, ... }:

let
  clangVersion = vars.languages.cpp;
  clang = pkgs."clang_${clangVersion}";
in {
  environment.systemPackages = [
    clang
    pkgs.clang-tools
    pkgs.gcc
  ];
}
