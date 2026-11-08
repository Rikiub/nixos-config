{
  flake.aspects.nix.nixos = { host, ... }: {
    # Metadata
    system.nixos.label = "NixOS";
    networking.hostName = host.name;

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
