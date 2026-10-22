{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        base

        # Boot
        kernel
        limine
        plymouth

        # Core
        filesystem
        locale
        users

        # Programs
        just-cfg
        nix-ld
        sudo
        git
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
