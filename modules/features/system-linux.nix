{
  flake.aspects = { aspects, ... }: {
    system-linux = {
      includes = with aspects; [
        system-base

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
