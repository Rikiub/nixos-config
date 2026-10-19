{
  flake.modules.nixos.nix = { config, ... }: {
    # Metadata
    system.stateVersion = "26.05";
    system.nixos.label = "NixOS";
    networking.hostName = config.host.name;

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
