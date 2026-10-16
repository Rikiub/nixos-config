{ config, pkgs, ... }:

let
  root = "/etc/nixos";

  zedSettings = {
    lsp.nixd.settings = {
      formatting.command = [ "nixfmt" ];

      nixpkgs.expr = "import <nixpkgs> { }";
      options = {
        nixos.expr = "(builtins.getFlake \"${root}\").nixosConfigurations.${config.user.name}.options";
        home-manager.expr = "(builtins.getFlake \"${root}\").nixosConfigurations.${config.user.name}.options.home-manager.users.type.getSubOptions []";
      };
    };
  };
in
{
  environment.etc = {
    "zed/settings.json".text = builtins.toJSON zedSettings;
  };

  environment.systemPackages = with pkgs; [
    # LSP
    nixd
    nil

    # Formatter
    nixfmt

    # Linter
    statix
  ];
}
