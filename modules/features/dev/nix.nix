{
  flake.aspects.nix.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      nixd # LSP
      nil # LSP
      nixfmt # Nix Formatter
      statix # Nix Linter
    ];
  };
}
