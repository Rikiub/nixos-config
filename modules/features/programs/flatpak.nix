{
  flake.modules.nixos.flatpak = { pkgs, ... }: {
    # Enable Flatpak for some niche apps
    services.flatpak.enable = false;

    systemd.services.flatpak-repo = {
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.flatpak ];
      script = ''
        flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
