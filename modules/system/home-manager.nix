{
  config,
  inputs,
  hostname,
  ...
}:

{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs hostname; };

    users.${config.user.name} = {
      imports = [
        (inputs.import-tree ../home)
        (inputs.import-tree ../../hosts/${hostname}/home)
      ];
    };
  };
}
