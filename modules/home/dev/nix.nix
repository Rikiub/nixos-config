{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # LSP
    nixd
    nil

    # Linter
    statix
  ];
}
