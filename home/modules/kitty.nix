{ config, pkgs, ...}:

{
  programs.kitty = {
    enable = true;

    shellIntegration.enableZshIntegration = true;

    settings = {

      theme = "Gruvbox Dark";

      # Font
      font_family = "JetBrainsMono Nerd Font";
      font_size = "11.0";
      adjust_line_height = "100%";
      disable_ligatures = "cursor";

      # Main window
      hide_window_decorations = "titlebar-only";
      window_padding_width = "0";
      window_margin_width = "0";

      # Tabs tab bar
      # Tab bar options
      tab_bar_edge = "top";
      tab_bar_margin_width = "3.0";
      tab_bar_style = "fade";
      tab_fade = "1.0";
      tab_bar_align = "left";

      tab_title_template = "{index}: {tab.active_wd.rsplit('/', 1)[-1]}";

      active_tab_font_style = "normal";
      tab_bar_background = "#272727";
      inactive_tab_background = "#272727";
      inactive_tab_foreground = "#ebdbb2";
      active_tab_background = "#272727";
      active_tab_foreground = "#b8ba25";

      # Background
      background_opacity = "0.9";
      backgorund_blur = "1";
      #dynamic_background_opacity = "true";
      cursor_shape = "beam";

      # Misc
      editor = "codium"; # TODO: La env "EDITOR" está establecida a nano... esperar a nvim
      scrollback_lines = "5000";
      include = "./current-theme.conf";
      update_check_interval = "0";
      enabled_layouts = "tall,fat,grid";
      resize_in_steps = true;
      bell_path = "~/JaxOS/themes/bell.wav";

    };
    environment.CURRENT_TERMINAL = "kitty";
  };
}