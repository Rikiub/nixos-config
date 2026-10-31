{
  flake.aspects.lsp.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      bash-language-server # Bash
      ty # Python

      vscode-json-languageserver # JSON
      yaml-language-server # YAML
      taplo # TOML
      just-lsp # justfile

      nixd # Nix
      nil # Nix
      nixfmt # Nix Formatter
      statix # Nix Linter
    ];
  };
}
