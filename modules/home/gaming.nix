{ pkgs, ... }:

{
  home.packages = [
    pkgs.heroic
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
}
