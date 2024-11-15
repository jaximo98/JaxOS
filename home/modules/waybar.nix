{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";

        modules-left = ["hyprland/workspaces" "hyprland/window"];
        modules-center = ["clock"];
        modules-right = [ "network" "backlight" "pulseaudio" "battery"  ];

        "network" = {
          "format" = "{ifname}";
          "format-wifi" = "{essid} ";
          "format-ethernet" = "󰈁";
          "format-disconnected" = "";
          "tooltip-format"= "{ifname} via {gwaddr} 󰊗";
          "tooltip-format-wifi"= "{essid} ({signalStrength}%) ";
          "tooltip-format-ethernet"= "{ipaddr}/{cidr} | {ifname} ";
          "tooltip-format-disconnected"= "Disconnected";
          "on-click" = "kitty --execute nmtui";
        };


        "battery" = {
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
          "tooltip-format" = "{power}w | {timeTo}";
        };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth"= "{volume}% {icon}";
          "format-muted"= "";
          "format-icons"= {
              "alsa_output.pci-0000_00_1f.3.analog-stereo"= "";
              "alsa_output.pci-0000_00_1f.3.analog-stereo-muted"= "";
              "headphone"= "";
              "hands-free"= "";
              "headset"= "";
              "phone"= "";
              "phone-muted"= "";
              "portable"= "";
              "car"= "";
              "default"= ["" ""];
          };
          "on-click" = "pavucontrol";
        };

        "backlight" = {
          "device" = "intel_backlight";
          "format" = "L {percent}% {icon}";
          "format-icons" = ["" ""];
          "interval" = "2";
          "scroll-step" = "10.0";
          "tooltip" = "false";
        };

        "clock" = {
          "format" = "{:%A, %d. %B  %H:%M}";
          "timezone" = "Europe/Madrid";
          "tooltip-format" = "<tt>{calendar}";
          "calendar" = {
            "mode" = "year";
            "mode-mon-col" = "3";
            "week-pos" = "right";
            "format" = {
                "months" =     "<span color='#ffead3'><b>{}</b></span>";
                "days"=       "<span color='#ecc6d9'><b>{}</b></span>";
                "weeks"=      "<span color='#99ffdd'><b>W{}</b></span>";
                "weekdays"=   "<span color='#ffcc66'><b>{}</b></span>";
                "today"=      "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
            "actions" = {
                    "on-click-right"= "mode";
                    "on-scroll-up"= "shift_up";
                    "on-scroll-down"= "shift_down";
            };
          };
        };

      };
    };
    style = ''
    
@keyframes blink-warning {
    70% {
        color: @light;
    }

    to {
        color: @light;
        background-color: @warning;
    }
}

@keyframes blink-critical {
    70% {
      color: @light;
    }

    to {
        color: @light;
        background-color: @critical;
    }
}


/* -----------------------------------------------------------------------------
 * Styles
 * -------------------------------------------------------------------------- */

/* COLORS */

/* Gruvbox Dark */

/*@define-color bg #353C4A;*/
@define-color light #D8DEE9;
/*@define-color dark @nord_dark_font;*/
@define-color warning #ebcb8b;
/*@define-color critical #BF616A;*/
/*@define-color mode @bg;*/
/*@define-color workspaces @bg;*/
/*@define-color workspaces @nord_dark_font;*/
/*@define-color workspacesfocused #655b53;*/
/*@define-color tray @bg;*/
/*@define-color workspacesfocused #4C566A;
@define-color tray @workspacesfocused;
@define-color sound #EBCB8B;
@define-color network #5D7096;
@define-color memory #546484;
@define-color cpu #596A8D;
@define-color temp #4D5C78;
@define-color layout #5e81ac;
@define-color battery #88c0d0;
@define-color date #434C5E;
@define-color time #434C5E;
@define-color backlight #434C5E;*/
@define-color nord_bg #282828;
@define-color nord_bg_blue @bg;
@define-color nord_light #D8DEE9;

@define-color nord_dark_font #272727;


@define-color bg #282828;
@define-color critical #BF616A;
@define-color tray @bg;
@define-color mode @bg;

@define-color bluetint #448488;
@define-color bluelight #83a597;
@define-color magenta-dark #b16185;


@define-color font_gruv_normal #ebdbb2;
@define-color font_gruv_faded #a89985;
@define-color font_gruv_darker #D8DEE9;
@define-color font_dark_alternative #655b53;

/* Reset all styles */
* {
    border: none;
    border-radius: 0px;
    min-height: 0;
    /*margin: 0.15em 0.25em 0.15em 0.25em;*/
}

/* The whole bar */
#waybar {
    background: @bg;
    color: @light;
    font-family: "Cantarell", "Font Awesome 5 Pro";
    font-size: 9pt;
    font-weight: bold;
}

/* Each module */
#battery,
#clock,
#cpu,
#custom-layout,
#memory,
#mode,
#network,
#pulseaudio,
#temperature,
#custom-alsa,
#custom-pacman,
#custom-weather,
#custom-gpu,
#custom-playerctl,
#tray,
#backlight,
#language,
#custom-cpugovernor,
#custom-scratchpad-indicator,
#custom-pacman,
#idle_inhibitor,
#bluetooth {
/*    padding-left: 0.3em;
    padding-right: 0.3em;*/
    padding: 0.6em 0.8em;
}

/* Each module that should blink */
#mode,
#memory,
#temperature,
#battery {
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

/* Each critical module */
#memory.critical,
#cpu.critical,
#temperature.critical,
#battery.critical {
    color: @critical;
}

/* Each critical that should blink */
#mode,
#memory.critical,
#temperature.critical,
#battery.critical.discharging {
    animation-name: blink-critical;
    animation-duration: 2s;
}

/* Each warning */
#network.disconnected,
#memory.warning,
#cpu.warning,
#temperature.warning,
#battery.warning {
    background: @warning;
    color: @nord_dark_font;
}

/* Each warning that should blink */
#battery.warning.discharging {
    animation-name: blink-warning;
    animation-duration: 3s;
}

/* Adding arrows to boxes */
/*#custom-arrow1 {
    font-size: 16px;
    color: @sound;
    background: transparent;
}

#custom-arrow2 {
    font-size: 16px;
    color: @network;
    background: @sound;
}

#custom-arrow3 {
    font-size: 16px;
    color: @memory;
    background: @network;
}

#custom-arrow4 {
    font-size: 16px;
    color: @cpu;
    background: @memory;
}

#custom-arrow5 {
    font-size: 16px;
    color: @temp;
    background: @cpu;
}

#custom-arrow6 {
    font-size: 16px;
    color: @layout;
    background: @temp;
}

#custom-arrow7 {
    font-size: 16px;
    color: @battery;
    background: @layout;
}

#custom-arrow8 {
    font-size: 16px;
    color: @date;
    background: @battery;
}

#custom-arrow9 {
    font-size: 16px;
    color: @time;
    background: @date;
}*/

#custom-arrow1 {
    font-size: 2em;
    color: @bg;
    background: @bluetint;
}
#custom-arrow2 {
    font-size: 2em;
    color: @bluetint;
    background: @font_dark_alternative;
}
#custom-arrow3 {
    font-size: 2em;
    color: @font_dark_alternative;
    background: @bg;
}
#custom-arrow4 {
    font-size: 2.1em;
    color: @font_gruv_normal;
    background: @bg;
}
#custom-arrow5 {
    font-size: 2.12em;
    color: @font_gruv_normal;
    background: @bg;
}
#custom-arrow6 {
    font-size: 2em;
    color: @font_dark_alternative;
    background: @bg;
}
#custom-arrow7 {
    font-size: 2em;
    color: @bluetint;
    background: @font_dark_alternative;
}
#custom-arrow8 {
    font-size: 2em;
    color: @bg;
    background: @bluetint;
}

/* And now modules themselves in their respective order */
#clock.time {
    background: @bg;
    color: @font_gruv_normal;
}
#clock.date {
    background: @bg;
    color: @font_gruv_faded;
}

#custom-scratchpad-indicator {
    background: @bluetint;
    color: @font_gruv_normal;
}
#language {
    background: @bg;
    color: @font_gruv_normal;
}
#custom-kdeconnect {
    background: @bg;
    color: @font_gruv_normal;
}
#custom-pacman {
    background: @bluetint;
    color: @font_gruv_normal;
}
#idle_inhibitor {
    background: @font_dark_alternative;
    color: @font_gruv_normal;
}
#custom-playerctl {
    font-size: 0.9em;
    color: @font_gruv_normal;
}
#custom-playerctl.paused{
    color: @font_dark_alternative;
    font-size: 0.9em;
}
/* Workspaces stuff */
#workspaces {
}
#workspaces button {
    background: @font_gruv_normal;
    padding: 0em 1.2em;
    color: @font_dark_alternative;
    min-width: 0em;
}
#workspaces button.focused {
    font-weight: bolder; /* Somewhy the bar-wide setting is ignored*/
}
#workspaces button.urgent {
    color: #c9545d;
    opacity: 1;
}
#custom-cpugovernor {
    background-color: @font_dark_alternative;
    color: @font_gruv_normal;
}
#custom-cpugovernor.perf {
    
}
#cpu {
    background: @bluetint;
    color: @font_gruv_normal;
    padding-left: 0em;
    padding-right: 0.2em;
}
#cpu.critical {
    color: @nord_dark_font;
    background: @critical;
}
#temperature {
    background-color: @bluetint;
    color: @font_gruv_normal;
    padding-right: 0em;
}
#temperature.critical {
    background:  @critical;
}
#custom-gpu {
    background: @bluetint;
    color: @font_gruv_normal;
    padding-left: 0em;    
}
#pulseaudio {
    background: @bg;
    color: @font_gruv_normal;
}
#pulseaudio.muted {
    color: #fb4833;
}
#pulseaudio.source-muted {
    /* moved to config */
}
#bluetooth {
    background: @bg;
    color: @font_gruv_normal;
}
#network {
    background: @bg;
    color: @font_gruv_faded;
}
#tray {
    background: @bg;
    color: @font_gruv_normal;
}

#custom-alsa {
    background: @sound;
}
#memory {
    background: @memory;
}
#custom-layout {
    background: @layout;
}
#mode { /* Shown current Sway mode (resize etc.) */
    color: @light;
    background: @mode;
}
#battery {
    background: @battery;
}

#backlight {
    background: @backlight;
}
#window {
    margin-right: 40px;
    margin-left: 40px;
    font-weight: normal;
}
#custom-weather {
    background: @mode;
    font-weight: bold;
    padding: 0 0.6em;
}
    '';
  };
}