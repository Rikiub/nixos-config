{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        defaults

        # Core
        kernel
        filesystem
        locale
        users

        # Programs
        cfg
        nix-ld
        ssh
        sudo
      ];

      nixos = { };
      homeManager = { };
    };
  };
}
