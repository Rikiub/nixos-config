{
  flake.aspects.firefox.homeManager = { ... }: {
    programs.firefox = {
      enable = true;

      policies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            installation_mode = "force_installed";
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          };
        };

        SearchEngines = {
          Default = "Brave Search";
          Remove = [
            "Bing"
            "DuckDuckGo"
            "MercadoLibre Mexico"
            "Perplexity"
            "Wikipedia (es)"
          ];
        };
      };

      profiles.default = {
        search = {
          force = true;
          engines = {
            "Brave Search" = {
              urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
              icon = "https://cdn.search.brave.com/serp/v3/_app/immutable/assets/favicon-96x96.whEolsYu.png";
              definedAliases = [ "@brave" ];
            };
          };
        };

        settings = {
          "browser.tabs.inTitlebar" = 0;
          "browser.toolbars.bookmarks.visibility" = "never";
          "sidebar.verticalTabs" = true;
        };
      };
    };
  };
}
