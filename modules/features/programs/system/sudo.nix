{
  flake.aspects.sudo.nixos = { ... }: {
    # Replace sudo
    security.sudo.enable = false;
    security.sudo-rs.enable = true;
  };
}
