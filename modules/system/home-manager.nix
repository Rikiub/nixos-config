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
        ../home
        ../../hosts/${hostname}/home
      ];
    };
  };
}
