{ pkgs, ... }:

{
  # Set nushell as default
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
