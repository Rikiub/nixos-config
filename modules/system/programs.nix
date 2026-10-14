{ pkgs, ... }:

{
  programs = {
    # Improve compability with apps
    nix-ld = {
      enable = true;
    };
  };

  # Enable Flatpak for some niche apps
  services.flatpak.enable = true;

  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    '';
  };

  # Replace sudo
  security.sudo.enable = false;
  security.sudo-rs.enable = true;

  # Set nushell as default
  programs.nushell.enable = true;
  users.defaultUserShell = pkgs.nushell;
}
