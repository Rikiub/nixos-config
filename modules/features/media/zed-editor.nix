{
  flake.aspects.zed-editor.homeManager = { ... }: {
    programs.zed-editor = {
      enable = true;

      mutableUserSettings = true;
      userSettings = {
        format_on_save = "on";
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Frappé";
        };
      };

      extensions = [
        # Themes
        "catppuccin"

        # Languages
        "nix"
        "lua"
        "toml"
        "kdl"
        "python"
      ];
    };
  };
}
