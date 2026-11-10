{ inputs, ... }:
{
  flake-file.inputs = {
    # Nix Packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-lib.follows = "nixpkgs";

    # Host Addons
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Core
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-aspects.url = "github:denful/flake-aspects";
    import-tree.url = "github:denful/import-tree";
  };

  imports = with inputs; [
    flake-file.flakeModules.dendritic
    flake-aspects.flakeModule
  ];
}
