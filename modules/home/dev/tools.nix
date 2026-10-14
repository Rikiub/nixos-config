{ pkgs, ... }:

{
  home.packages = with pkgs; [
    just # Task Runner
  ];

  programs = {
    gh.enable = true; # Github CLI
    pnpm.enable = true; # NodeJS Package Manager
    uv.enable = true; # Python
  };
}
