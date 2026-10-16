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

        # Stub the runtime-generated files so `niri validate` can resolve includes.
        : > $out/noctalia.kdl

        niri validate --config $out/config.kdl
      '';
in
{
  imports = [ ./noctalia.nix ];

  home.packages = with pkgs; [
    niri
    cliphist
    xwayland-satellite
  ];

  xdg.configFile = {
    "niri/config.kdl".source = "${niriConfigChecked}/config.kdl";
    "niri/config.d".source = "${niriConfigChecked}/config.d";
    "niri/modules".source = "${niriConfigChecked}/modules";
  };
}
