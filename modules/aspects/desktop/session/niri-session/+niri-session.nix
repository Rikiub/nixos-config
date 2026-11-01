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
          niriConfigChecked =
            pkgs.runCommand "niri-config-checked"
              {
                nativeBuildInputs = [ pkgs.niri ];
              }
              ''
                cp -r ${./.} $out
                chmod -R u+w $out
                rm -f $out/*.nix

                niri validate --config $out/config.kdl
              '';
        in
        {
          # Config
          wayland.windowManager.niri.enable = true;
          xdg.configFile = {
            "niri/config.kdl".source = "${niriConfigChecked}/config.kdl";
            "niri/config.d".source = "${niriConfigChecked}/config.d";
            "niri/modules".source = "${niriConfigChecked}/modules";
          };

          # Persistent clipboard
          services.wl-clip-persist.enable = true;
        };
    };
  };
}
