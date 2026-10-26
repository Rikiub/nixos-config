{
  flake.aspects = { aspects, ... }: {
    nixos = {
      includes = with aspects; [
        defaults

        # Core
        boot
        filesystem
        kernel
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
