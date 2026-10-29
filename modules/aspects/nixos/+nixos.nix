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
        nh
        nx
        nix-ld
        ssh
        sudo
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
