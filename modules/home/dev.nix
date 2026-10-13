{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Nix LSP
    nixd
    nil
  ];

  programs = {
    # Editors
    fresh-editor.enable = true;
    zed-editor.enable = true;

    gh.enable = true; # Github CLI
    pnpm.enable = true; # NodeJS Package Manager
    uv.enable = true; # Python

    git = {
      enable = true;
      settings = {
        user.name = "Rikiub";
        user.email = "rikiub.dev@gmail.com";

        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}
