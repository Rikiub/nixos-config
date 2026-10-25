{
  flake.aspects.oo7.nixos = { ... }: {
    services.oo7.enable = true;
    security.pam.services.greetd.oo7.enable = true;
    security.polkit.enable = true;
  };
}
