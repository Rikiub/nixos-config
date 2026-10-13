{ pkgs, ... }:

{
  programs = {
    # Improve compability with apps
    nix-ld = {
      enable = true;
    };
  };

  # Replace sudo
  security.sudo.enable = false;
  security.sudo-rs.enable = true;

  # Set nushell as default
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
