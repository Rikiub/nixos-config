{
  flake.aspects.fresh-editor.homeManager = { ... }: {
    # Set as default
    home.sessionVariables = {
      EDITOR = "fresh";
    };

    programs.fresh-editor = {
      enable = true;
      mutableSettings = true;

      settings = {
        theme = "dracula";

        lsp = {
          python = [
            {
              enabled = true;
              auto_start = true;
              command = "ty";
              args = [ "server" ];
            }
          ];
        };
      };
    };
  };
}
