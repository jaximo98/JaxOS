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
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_bar_min_tabs = "1";
      tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{index}:{title}";
      tab_bar_margin_height = "0.0";

      # Background
      background_opacity = "0.9";
      #dynamic_background_opacity = "true";
      cursor_shape = "beam";

      # Misc
      editor = "codium"; # TODO: La env "EDITOR" está establecida a nano... esperar a nvim
      scrollback_lines = "5000";
      include = "./current-theme.conf";
      update_check_interval = "0";
      enabled_layouts = "tall,fat,grid";
      resize_in_steps = true;
      bell_path = "~/.config/kitty/bell.wav"

    };
    environment.CURRENT_TERMINAL = "kitty";
  };
}