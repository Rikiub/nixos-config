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

    nix = {
      # Optimization
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };

      optimise = {
        automatic = true;
        dates = [ "03:45" ];
      };
      settings.auto-optimise-store = true;

      # Experimental
      settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
