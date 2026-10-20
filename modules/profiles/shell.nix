{ config, ... }:
{
  flake.modules.nixos.profile-shell = { ... }: {
    imports = with config.flake.modules.nixos; [
      shell
    ];
  };

  flake.modules.homeManager.profile-shell = { ... }: {
    imports = with config.flake.modules.homeManager; [
      shell
    ];
  };
}
