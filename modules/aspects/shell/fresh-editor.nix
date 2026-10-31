{
  flake.aspects.fresh-editor.homeManager = { ... }: {
    programs.fresh-editor = {
      enable = true;
      defaultEditor = true;
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
