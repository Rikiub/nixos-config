{
  flake.aspects.keyring.nixos = { ... }: {
    # gnome-keyring
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
    security.polkit.enable = true;
  };
}
