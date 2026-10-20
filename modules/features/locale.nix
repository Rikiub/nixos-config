{
  flake.aspects.locale.nixos = { ... }: {
    # Set your time zone.
    time.timeZone = "America/Caracas";

    # Select internationalisation properties.
    i18n.defaultLocale = "es_VE.UTF-8";

    i18n.extraLocaleSettings = {
      LC_COLLATE = "C";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };

    # Configure console keymap
    console.keyMap = "us";
  };
}
