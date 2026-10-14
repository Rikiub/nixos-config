{
  nixpkgs.config.allowUnfree = true;

  # Optimization
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  nix.optimise = {
    automatic = true;
    dates = [ "03:45" ];
  };
  nix.settings.auto-optimise-store = true;

  # Experimental
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
