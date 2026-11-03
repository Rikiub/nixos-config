{
  flake.aspects.nix.nixos = { ... }: {
    # Metadata
    system.nixos.label = "NixOS";

    # NixOS Documentation
    documentation.nixos = {
      enable = false;
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Experimental features
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
