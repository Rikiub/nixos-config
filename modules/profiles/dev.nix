{ config, ... }:
{
  flake.modules.homeManager.profile-dev = { ... }: {
    imports = with config.flake.modules.homeManager; [
      git
      editors
      dev-nix
      dev-tools
    ];
  };
}
