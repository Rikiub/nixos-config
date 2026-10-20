{
  flake.modules.nixos.nix-ld = { ... }: {
    # Improve compability with apps
    programs.nix-ld = {
      enable = true;
    };
  };
}
