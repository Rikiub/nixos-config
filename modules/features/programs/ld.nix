{
  flake.modules.nixos.programs = {
    # Improve compability with apps
    programs.nix-ld = {
      enable = true;
    };
  };
}
