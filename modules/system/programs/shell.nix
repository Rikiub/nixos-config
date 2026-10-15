{ pkgs, ... }:

{
  # Required for pkexec
  environment.shells = with pkgs; [ nushell ];

  # Set nushell as default
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
