{
  flake.modules.homeManager.niri = { ... }: {
    # Desktop Shell
    programs.noctalia = {
      enable = true;

      settings = {
        bar = {
          default = {
            capsule = true;
            center = [
              "notifications"
              "clock"
              "media"
            ];
            end = [
              "tray"
              "group:g1"
              "group:g2"
              "session"
            ];
            reserve_space = false;
            smart_auto_hide = true;
            widget_spacing = 8;
            capsule_group = [
              {
                accordion = false;
                accordion_direction = "end";
                border_width = 1.0;
                enabled = true;
                fill = "surface_variant";
                id = "g1";
                members = [
                  "nightlight"
                  "brightness"
                  "volume"
                ];
                opacity = 1.0;
                padding = 6.0;
              }
              {
                accordion = false;
                accordion_direction = "end";
                border_width = 1.0;
                enabled = true;
                fill = "surface_variant";
                id = "g2";
                members = [
                  "network"
                  "bluetooth"
                  "battery"
                ];
                opacity = 1.0;
                padding = 6.0;
              }
            ];
          };
        };
        control_center = {
          sidebar_section = "none";
        };
        desktop_widgets = {
          enabled = false;
        };
        nightlight = {
          enabled = true;
          force = true;
        };
        shell = {
          niri_overview_type_to_launch_enabled = true;
          polkit_agent = true;
          settings_show_advanced = false;
          telemetry_enabled = true;
          panel = {
            control_center_placement = "floating";
            open_near_click_control_center = true;
          };
        };
        theme = {
          mode = "auto";
          source = "wallpaper";
          wallpaper_scheme = "m3-content";
          templates = {
            builtin_ids = [
              "gtk3"
              "gtk4"
              "kcolorscheme"
              "niri"
              "qt"
            ];
          };
        };
        widget = {
          battery = {
            display_mode = "graphic";
            show_label = false;
          };
          brightness = {
            show_label = false;
          };
          media = {
            hide_when_no_media = true;
          };
          network = {
            show_label = false;
          };
          notifications = {
            hide_when_no_unread = true;
          };
          tray = {
            drawer = true;
            match_adjacent_spacing = true;
          };
          volume = {
            show_label = false;
          };
        };
      };
    };
  };
}
