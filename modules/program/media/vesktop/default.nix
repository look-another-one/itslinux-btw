{ pkgs, ... }:
{
programs.vesktop = {
  enable = true;
  settings = {
    minimizeToTray = true;
    discordBranch = "stable";
  };
  # Vencord plugins
  vencord.settings.plugins = {
    MessageLogger = {
      enabled = true;
      ignoreSelf = true;
    };
    FakeNitro.enabled = true;
  };
};
}