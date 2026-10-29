{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        # Core
        boot
        filesystem
        kernel
        locale
        nix
        users

        # Programs
        nix-ld
        nx
        ssh
        sudo
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
