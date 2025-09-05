{ config, pkgs, ... }:

{
    # Firefox
    programs.firefox = {
      enable = true;
      policies = {
	SearchEngines = {
	  Default = "DuckDuckGo";
	};
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableFormHistory = true;
	OverrideFirstRunPage = "";
        OverridePostUpdatePage = "";
        DontCheckDefaultBrowser = true;
        DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
        SearchBar = "unified"; # alternative: "separate"
	SanitizeOnShutdown = {
	  Cache = true;
	  Cookies = true;
	  FormData = true;
	  History = true;
	  Sessions = true;
	  SiteSettings = true;
	};
	UserMessaging = {
	  UrlbarInterventions = false;
	};
	SearchSuggestEnabled = false;
        FirefoxSuggest = {
	  WebSuggestions = false;
	  SponsoredSuggestions = false;
	  ImproveSuggest = false;
	};
	Preferences = {
	  "browser.newtabpage.activity-stream.showSearch" = false;
	  "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
	  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.snippets" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
	  "browser.translations.automaticallyPopup" = false;
	  "browser.translations.enable" = false;
	  "browser.urlbar.suggest.searches" = false;
	  "browser.search.suggest.enabled" = false;
	};
	ExtensionSettings = {
            "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
            };
            # Keepassxc browser
            "keepassxc-browser@keepassxc.org" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser@keepassxc.org/latest.xpi";
              installation_mode = "force_installed";
            };
            # I still dont car about cookies
            "idcac-pub@guus.ninja" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/idcac-pub@guus.ninja/latest.xpi";
              installation_mode = "force_installed";
            };
            # FeedBro
            "{a9c2ad37-e940-4892-8dce-cd73c6cbbc0c}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/{a9c2ad37-e940-4892-8dce-cd73c6cbbc0c}/latest.xpi";
              installation_mode = "force_installed";
            };
            # Catppuccin Macchiato
            "{15cb5e64-94bd-41aa-91cf-751bb1a84972}" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/{15cb5e64-94bd-41aa-91cf-751bb1a84972}/latest.xpi";
              installation_mode = "force_installed";
	    };
        };
       };
     };
}
