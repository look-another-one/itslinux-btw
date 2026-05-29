{ pkgs, user, vars, ... }:
{
  users.users.${user.username} = {
    isNormalUser = true;
    description = user.description;
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [ zsh ];
    shell = pkgs.zsh;
  };

  home-manager.users.${user.username} = {
    home.file.".face".source = user.avatar;
    home.file.".face.icon".source = user.avatar;
  };
}
