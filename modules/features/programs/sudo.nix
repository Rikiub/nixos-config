{
  flake.modules.nixos.sudo = { ... }: {
    # Replace sudo
    security.sudo.enable = false;
    security.sudo-rs.enable = true;
  };
}
