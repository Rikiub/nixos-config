{
  flake.aspects.zed-editor.homeManager = { ... }: {
    programs.zed-editor = {
      enable = true;

      mutableUserSettings = true;
      userSettings = {
        format_on_save = "on";
        theme = {
          mode = "system";
        };
      };

      extensions = [
        "nix"
        "lua"
        "toml"
        "python"
      ];
    };
  };
}
