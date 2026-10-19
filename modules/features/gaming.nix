{
  flake.modules.nixos.gaming = { ... }: {
    programs = {
      steam.enable = true;
      gamemode.enable = true;
      gamescope.enable = true;
    };
  };

  flake.modules.homeManager.gaming = { pkgs, ... }: {
    home.packages = with pkgs; [
      heroic
    ];

    programs = {
      mangohud = {
        enable = true;
        settings = {
          fps = true;

          ram = true;
          vram = true;

          cpu_stats = true;
          cpu_temp = true;

          gpu_stats = true;
          gpu_temp = true;
        };
      };
    };
  };
}
