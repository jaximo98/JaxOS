{ config, pkgs, ...}:
{
  /*home.file."firefox-theme" = {
    target = ".mozilla/firefox/jaximo/chrome/firefox-theme";
    source = pkgs.fetchFromGitHub {
      owner = "FirefoxCSSThemers";
      repo = "GruvFox";
      rev = "066681d7f123e359ab564281a148d915a1c25c64";
      hash = "sha256-6+h84ZxEnhDysGD6JQQisyJFqP0RRHptsVjrSw9UKps=";
    };
  };*/

  programs.firefox = {
    enable = true;

    profiles.jaximo = {
      isDefault = true;

      search.default = "DuckDuckGo";
      search.force = true;

      extensions = with config.nur.repos.rycee.firefox-addons; [
        sidebery
        darkreader
        octotree
        ublock-origin
        bitwarden
        sponsorblock
        behave
        youtube-shorts-block
      ];

      userChrome = ''
        @import url("firefox-theme/chrome/userChrome.css");
        /**
        * Dynamic Horizontal Tabs Toolbar (with animations)
        * sidebar.verticalTabs: false (with native horizontal tabs)
        */
        #main-window #TabsToolbar > .toolbar-items {
          overflow: hidden;
          transition: height 0.3s 0.3s !important;
        }
        /* Default state: Set initial height to enable animation */
        #main-window #TabsToolbar > .toolbar-items { height: 3em !important; }
        #main-window[uidensity="touch"] #TabsToolbar > .toolbar-items { height: 3.35em !important; }
        #main-window[uidensity="compact"] #TabsToolbar > .toolbar-items { height: 2.7em !important; }
        /* Hidden state: Hide native tabs strip */
        #main-window[titlepreface*="XXX"] #TabsToolbar > .toolbar-items { height: 0 !important; }
        /* Hidden state: Fix z-index of active pinned tabs */
        #main-window[titlepreface*="XXX"] #tabbrowser-tabs { z-index: 0 !important; }
        /* Hidden state: Hide window buttons in tabs-toolbar */
        #main-window[titlepreface*="XXX"] #TabsToolbar .titlebar-spacer,
        #main-window[titlepreface*="XXX"] #TabsToolbar .titlebar-buttonbox-container {
          display: none !important;
        }

        #sidebar-box #sidebar-header {
        display: none !important;
        }
      '';
      userContent = ''
        @import url("firefox-theme/chrome/userContent.css");
      '';

      settings = {
        "signon.rememberSignons" = false;
        "identity.fxaccounts.enabled" = false;


        # --- PeskyFox ---
        #UI
        "browser.privatebrowsing.vpnpromourl" = "";
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
        "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
        "browser.preferences.moreFromMozilla" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.tabs.tabmanager.enabled" = false;
        #Theme adjustments
        "browser.compactmode.show" = true;
        "browser.display.focus_ring_on_anything" = true;
        "browser.display.focus_ring_style" = 0;
        "browser.display.focus_ring_width" = 0;
        "layout.css.prefers-color-scheme.content-override" = 2;
        #Cookie banner
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;
        #Fullscreen
        "full-screen-api.transition-duration.enter" = "0 0";
        "full-screen-api.transition-duration.leave" = "0 0";
        "full-screen-api.warning.delay" = -1;
        "full-screen-api.warning.timeout" = 0;
        #"gfx.webrender.quality.force-subpixel-aa-where-possible" = true;
        #Urlbar
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.calculator" = true;
        "browser.urlbar.unitConversion.enabled" = true;
        "browser.urlbar.trending.featureGate" = false;
        #Newpage
        "browser.startup.page" = 3;
        "browser.startup.homepage" = "file:///home/jaximo/JaxOS/themes/firefox_startpage.html";
        "browser.newtabpage.enabled" = false;
        #Pocket
        "extensions.pocket.enabled" = false;
        #Downloads
        "browser.download.autohideButton" = true;
        "browser.download.alwaysOpenPanel" = false;
        "browser.download.manager.addToRecentDocs" = false;
        #PDF
        "browser.download.open_pdf_attachments_inline" = true;
        #Tab behavior
        "browser.bookmarks.openInTabClosesMenu" = "false";
        "browser.menu.showViewImageInfo" = true;
        "findbar.highlightAll" = true;
        "layout.word_select.eat_space_to_next_word" = false;
        "widget.gtk.hide-pointer-while-typing.enabled" = false;
        #Other
        "browser.tabs.tabMinWidth" = 120;
        # --- Fastfox ---
        "content.notify.interval" = 100000;
        "gfx.canvas.accelerated.cache-items" = 4096;
        "gfx.canvas.accelerated.cache-size" = 512;
        "gfx.content.skia-font-cache-size" = 20;
        "browser.cache.jsbc_compression_level" = 3;
        "media.memory_cache_max_size" = 65536;
        "media.cache_readahead_limit" = 7200;
        "media.cache_resume_threshold" = 3600;
        "image.mem.decode_bytes_at_a_time" = 32768;
        "network.http.max-connections" = 1800;
        "network.http.max-persistent-connections-per-server" = 10;
        "network.http.max-urgent-start-excessive-connections-per-host" = 5;
        "network.http.pacing.requests.enabled" = false;
        "network.dnsCacheExpiration" = 3600;
        "network.ssl_tokens_cache_capacity" = 10240;
        "network.prefetch-next" = false;
        "layout.css.grid-template-masonry-value.enabled" = true;
        "dom.enable_web_task_scheduling" = true;
        "dom.security.sanitizer.enabled" = true;
        # --- Smoothfox ---
        "apz.overscroll.enabled" = true;  
        "general.smoothScroll" = true;  
        "general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS" = 12;
        "general.smoothScroll.msdPhysics.enabled" = true;
        "general.smoothScroll.msdPhysics.motionBeginSpringConstant" = 600;
        "general.smoothScroll.msdPhysics.regularSpringConstant" = 650;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaMS" = 25;
        "general.smoothScroll.msdPhysics.slowdownMinDeltaRatio" = "2";
        "general.smoothScroll.msdPhysics.slowdownSpringConstant" = 250;
        "general.smoothScroll.currentVelocityWeighting" = "1";
        "general.smoothScroll.stopDecelerationWeighting" = "1";
        "mousewheel.default.delta_multiplier_y" = 300;

        # --- Securefox ---
        # --- Tracking Protection ---
        "browser.contentblocking.category" = "strict";
        "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
        "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
        "network.cookie.sameSite.noneRequiresSecure" = true;
        "browser.download.start_downloads_in_tmp_dir" = true;
        "browser.helperApps.deleteTempFileOnExit" = true;
        "browser.uitour.enabled" = false;
        "privacy.globalprivacycontrol.enabled" = true;

        # --- OCSP & Certs / HPKP ---
        "security.OCSP.enabled" = 0;
        "security.remote_settings.crlite_filters.enabled" = true;
        "security.pki.crlite_mode" = 2;

        # --- SSL / TLS ---
        "security.ssl.treat_unsafe_negotiation_as_broken" = true;
        "browser.xul.error_pages.expert_bad_cert" = true;
        "security.tls.enable_0rtt_data" = false;

        # --- Disk Avoidance ---
        "browser.privatebrowsing.forceMediaMemoryCache" = true;
        "browser.sessionstore.interval" = 60000;

        # --- Shutdown & Sanitizing ---
        "privacy.history.custom" = true;

        # --- Search / URL Bar ---
        "browser.search.separatePrivateDefault.ui.enabled" = true;
        "browser.urlbar.update2.engineAliasRefresh" = true;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.formfill.enable" = false;
        "security.insecure_connection_text.enabled" = true;
        "security.insecure_connection_text.pbmode.enabled" = true;
        "network.IDN_show_punycode" = true;

        # --- HTTPS-First Policy ---
        "dom.security.https_first" = true;
        "dom.security.https_first_schemeless" = true;

        # --- Passwords ---
        "signon.formlessCapture.enabled" = false;
        "signon.privateBrowsingCapture.enabled" = false;
        "network.auth.subresource-http-auth-allow" = 1;
        "editor.truncate_user_pastes" = false;

        # --- Mixed Content + Cross-Site ---
        "security.mixed_content.block_display_content" = true;
        "security.mixed_content.upgrade_display_content" = true;
        "security.mixed_content.upgrade_display_content.image" = true;
        "pdfjs.enableScripting" = false;
        "extensions.postDownloadThirdPartyPrompt" = false;

        # --- Headers / Referers ---
        "network.http.referer.XOriginTrimmingPolicy" = 2;

        # --- Containers ---
        "privacy.userContext.ui.enabled" = true;

        # --- WebRTC ---
        "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
        "media.peerconnection.ice.default_address_only" = true;

        # --- Safe Browsing ---
        "browser.safebrowsing.downloads.remote.enabled" = false;

        # --- Mozilla ---
        "permissions.default.desktop-notification" = 2;
        "permissions.default.geo" = 2;
        "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
        "permissions.manager.defaultsUrl" = "";
        "webchannel.allowObject.urlWhitelist" = "";

        # --- Telemetry ---
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;

        # --- Experiments ---
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        # --- Crash Reports ---
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        # --- Detection ---
        "captivedetect.canonicalURL" = "";
        "network.captive-portal-service.enabled" = false;
        "network.connectivity-service.enabled" = false;

        # Personal overrides
        "app.update.auto" = true;
        "privacy.userContext.enabled" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "ui.key.menuAccessKey" = 0;
        "accessibility.force_disabled" = 1;
        "signon.generation.enabled" = false;
        "signon.firefoxRelay.feature" = "";
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.addresses.enabled" = false;

        "extensions.autoDisableScopes" = 0;
        "extensions.enabledScopes" = 15;

        "browser.firefox-view.feature-tour" = false;
        "browser.firefox-view.view-count" = false;
        "browser.tabs.firefox-view" = false;
        "browser.tabs.firefox-view.logLevel" = false;

        #"browser.download.useDownloadDir" = true;
        "browser.translations.enable" = false;
        "browser.translations.automaticallyPopup" = false;
        "browser.translations.panelShown" = false;
        "media.videocontrols.picture-in-picture.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

      };
    };

    policies = {
      NoDefaultBookmarks = true;

      # TODO: Not working...  https://github.com/nix-community/home-manager/issues/3569
      SearchEngines = {
        PreventInstalls = true;
        Add = [
          {
            Name = "MyNixOS";
            URLTemplate = "https://mynixos.com/search?q={searchTerms}";
            Method = "GET";
            Description = "Search MyNixOS packages";
          }
          {
            Name = "RAE";
            URLTemplate = "https://dle.rae.es/{searchTerms}";
            Method = "GET";
            Description = "Spanish Real Academy Dictionary";
          }
        ];
        Remove = [
          "Amazon.com"
          "Bing"
          "Google"
          "Qwant"
          "Wikipedia (en)"
        ];
        Default = "DuckDuckGo";
      };

      Bookmarks = [
        {
          Title = "Gmail";
          URL = "https://mail.google.com/";
          Folder = "Private";
        }
        {
          Title = "CV";
          URL = "https://informatica.cv.uma.es/";
          Folder = "Private";
        }
        {
          Title = "Spotify";
          URL = "https://open.spotify.com/";
        }
        {
          Title = "Youtube Music";
          URL = "https://music.youtube.com/";
        }
        {
          Title = "ChatGPT";
          URL = "https://chatgpt.com/";
        }
        {
          Title = "WhatsApp Web";
          URL = "https://web.whatsapp.com/";
          Folder = "Private";
        }
        {
          Title = "Gitbook";
          URL = "https://app.gitbook.com/o/JVk3cZvIVIu83u4yjTrl/s/cUFXoXiseORYBckkMbVy/papeles-de-diseno/mecanicas-principales";
        }
        {
          Title = "Github";
          URL = "https://github.com/jaximo98/";
        }
      ];
    };
  };
}