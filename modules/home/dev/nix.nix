{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix LSP
    nixd
    nil
  ];
}
