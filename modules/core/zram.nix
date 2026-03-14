{ config, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    memoryMax = 16 * 1024 * 1024 * 1024; # 16GB max memory limit
  };
}
