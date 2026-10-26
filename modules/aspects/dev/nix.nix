{
  flake.aspects.nix.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      # LSP
      nixd
      nil

      # Formatter
      nixfmt

      # Linter
      statix
    ];
  };
}
