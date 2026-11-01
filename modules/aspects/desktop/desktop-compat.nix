{
  flake.aspects.desktop-compat.nixos = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      wl-clipboard # Required for tools (Like GitHub CLI)
      xdg-user-dirs-gtk # Required for Nautilus
    ];

    services.udisks2.enable = true; # File managers support
  };
}
