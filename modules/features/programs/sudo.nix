{
  flake.modules.nixos.programs = { ... }: {
    # Replace sudo
    security.sudo.enable = false;
    security.sudo-rs.enable = true;
  };
}
