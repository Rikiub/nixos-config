{
  flake.modules.nixos.keyring = { ... }: {
    security.polkit.enable = true;

    security.pam.services.greetd.enableGnomeKeyring = true;
    services.gnome.gnome-keyring.enable = true;
  };
}
