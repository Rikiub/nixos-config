{
  flake.aspects.lsp.homeManager = { pkgs, ... }: {
    home.packages = with pkgs; [
      bash-language-server # Bash
      ty # Python

      vscode-json-languageserver # JSON
      yaml-language-server # YAML
      taplo # TOML
    ];
  };
}
