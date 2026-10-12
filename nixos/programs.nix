{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Nix LSP for editors
    nixd
    nil

    # Core editors
    fresh-editor
    zed-editor
  ];

  # Essensial
  programs.git.enable = true;

  # Set nushell as default
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
