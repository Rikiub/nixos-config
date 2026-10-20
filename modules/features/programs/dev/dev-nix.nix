{
  flake.modules.homeManager.dev-nix = { pkgs, ... }: {
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
