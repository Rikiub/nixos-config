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

    # Web
    pnpm.enable = true;

    # Python
    uv.enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "Rikiub";
      user.email = "rikiub.dev@gmail.com";

      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
