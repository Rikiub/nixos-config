{
  flake.aspects = { aspects, ... }: {
    niri-session = {
      includes = with aspects; [ noctalia ];

      nixos = { ... }: {
        programs.niri.enable = true;
      };

      homeManager =
        { pkgs, ... }:
        let
          localDir = ./niri;
          cfgDir =
            pkgs.runCommand "niri-config-checked"
              {
                nativeBuildInputs = [ pkgs.niri ];
              }
              ''
                cp -r ${localDir} $out
                chmod -R u+w $out

                niri validate --config $out/config.kdl
              '';
        in
        {
          # Config
          wayland.windowManager.niri.enable = true;
          xdg.configFile = {
            "niri/config.kdl".source = "${cfgDir}/config.kdl";
            "niri/config.d".source = "${cfgDir}/config.d";
            "niri/modules".source = "${cfgDir}/modules";
          };

          # Persistent clipboard
          services.wl-clip-persist.enable = true;
        };
    };
  };
}
