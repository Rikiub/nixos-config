{
  flake.aspects.fresh-editor = {
    nixos = { ... }: {
      nixpkgs.overlays = [
        (final: prev: {
          fresh-editor = prev.fresh-editor.overrideAttrs (oldAttrs: {
            buildInputs = (oldAttrs.buildInputs or [ ]) ++ [ final.oniguruma ];
          });
        })
      ];
    };

    homeManager = { ... }: {
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
  };
}
