{
  flake.aspects.limine.nixos = { ... }: {
    boot.loader = {
      limine = {
        enable = true;
        maxGenerations = 3;

        # Include Windows partition
        extraEntries = ''
          /Windows 11
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
