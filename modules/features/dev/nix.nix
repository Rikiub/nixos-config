{
  flake.modules.homeManager.dev = { pkgs, ... }: {
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
