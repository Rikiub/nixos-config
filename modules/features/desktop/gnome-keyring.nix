{
  flake.aspects.gnome-keyring.nixos = { ... }: {
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
