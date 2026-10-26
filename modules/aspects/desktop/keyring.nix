{
  flake.aspects.keyring.nixos = { ... }: {
    # gnome-keyring
    services.gnome.gnome-keyring.enable = true;

    security = {
      polkit.enable = true;
      pam.services = {
        greetd.enableGnomeKeyring = true;
        login.enableGnomeKeyring = true;
      };
    };
  };
}
