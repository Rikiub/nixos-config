{ pkgs, ... }:

{
  home.packages = with pkgs; [
    just # Task Runner
  ];

  programs = {
    pnpm.enable = true; # NodeJS Package Manager
    uv.enable = true; # Python
  };
}
