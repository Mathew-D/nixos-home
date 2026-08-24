{ inputs, hmHost ? null, ... }:

let
  profiles = {
    main = {
      primaryOutput = "DP-1";
      chatOutput = "DP-1";
      mediaOutput = "DP-2";
      mailOutput = "DP-3";
      auxOutput = "HDMI-A-1";
      brightnessKeybinds = {
        "XF86MonBrightnessUp" = "spawn:noctalia msg brightness-up 1%";
        "XF86MonBrightnessDown" = "spawn:noctalia msg brightness-down 1%";
      };
      outputs = {
        "DP-3" = {
          mode = "3840x2160";
          scale = 1.5;
          position = [ 0 1147 ];
          workspaces = 7;
        };
        "DP-2" = {
          mode = "2560x1440@165";
          scale = 1.0;
          position = [ 2560 1147 ];
          workspaces = 6;
        };
        "DP-1" = {
          mode = "3840x2160";
          scale = 1.5;
          position = [ 5120 1147 ];
          workspaces = 5;
        };
        "HDMI-A-1" = {
          mode = "1680x1050";
          scale = 1.0;
          position = [ 2640 97 ];
          workspaces = 9;
        };
      };
    };

    forest = {
      primaryOutput = "DP-1";
      chatOutput = "DP-3";
      mediaOutput = "DP-1";
      mailOutput = "DP-2";
      auxOutput = "HDMI-A-1";
      brightnessKeybinds = {
        "XF86MonBrightnessUp" = "spawn:noctalia msg brightness-up 1%";
        "XF86MonBrightnessDown" = "spawn:noctalia msg brightness-down 1%";
      };
      outputs = {
        "DP-3" = {
          mode = "1920x1080";
          scale = 1.0;
          position = [ 4240 1410 ];
          workspaces = 5;
        };
        "DP-2" = {
          mode = "1680x1050";
          scale = 1.0;
          position = [ 0 1440 ];
          workspaces = 7;
        };
        "DP-1" = {
          mode = "2560x1440@180";
          scale = 1.0;
          position = [ 1680 1050 ];
          workspaces = 6;
        };
        "HDMI-A-1" = {
          mode = "1680x1050";
          scale = 1.0;
          position = [ 2153 0 ];
          workspaces = 9;
        };
      };
    };

    laptop = {
      primaryOutput = "eDP-1";
      chatOutput = "eDP-1";
      mediaOutput = "eDP-1";
      mailOutput = "eDP-1";
      auxOutput = "eDP-1";
      brightnessKeybinds = {
        "XF86MonBrightnessUp" = "spawn:brightnessctl --class=backlight set +10%";
        "XF86MonBrightnessDown" = "spawn:brightnessctl --class=backlight set 10%-";
      };
      outputs = {
        "eDP-1" = {
          mode = "2880x1800@120.000";
          scale = 1.5;
          position = [ 0 0 ];
          workspaces = 9;
        };
      };
    };
  };

  profile = profiles.${if hmHost != null && builtins.hasAttr hmHost profiles then hmHost else "main"};

  wsTarget = workspace: output: "${toString workspace}/${output}";

  workspaceSelectors = {
    ws1 = wsTarget 1 profile.primaryOutput;
    ws2 = wsTarget 2 profile.primaryOutput;
    ws3 = wsTarget 3 profile.primaryOutput;
    ws4 = wsTarget 4 profile.primaryOutput;
    ws5 = wsTarget 5 profile.chatOutput;
    ws6 = wsTarget 6 profile.mediaOutput;
    ws7 = wsTarget 7 profile.mailOutput;
    ws8 = wsTarget 8 profile.auxOutput;
    ws9 = wsTarget 9 profile.auxOutput;
  };

  sharedWindowRules = [
    {
      match.app_id = "^foot$";
      default_width = 0.5;
    }
    {
      match.app_id = "^(code|thunar|org\\.gnome\\.Nautilus)$";
      opacity = 0.9;
    }
    {
      match.app_id = "^(Emulator|zenity|xdg-desktop-portal|qalculate-gtk|org\\.pulseaudio\\.pavucontrol|org\\.gnome\\.Calculator|nm-connection-editor|python3|veracrypt|org\\.manjaro\\.pamac\\.manager|gedit|dev-nohus-rift-MainKt)$";
      default_floating = true;
    }
    {
      match.title = "^(Open File|Select|Choose a wallpaper|Open Folder|Save As|Library|Attention|Choose Where to Download|File Operation Progress|Rename|Copy Files|Move Files|Search Files)$";
      default_floating = true;
    }
    {
      match.app_id = "^org\\.mozilla\\.Thunderbird$";
      match.title = "^Write:.*";
      default_floating = true;
    }
    {
      match.app_id = "^org\\.gnome\\.FileRoller$";
      default_floating = true;
      default_size = [ 920 400 ];
    }
    {
      match.app_id = "^(mpv|io\\.github\\.celluloid_player\\.Celluloid|eog)$";
      default_output = profile.mediaOutput;
    }
    {
      match.app_id = "^dev\\.noctalia\\.Noctalia\\.Settings$";
      default_floating = true;
      default_size = [ 1080 920 ];
      opacity = 0.9;
    }
  ];

  hostWindowRules = if hmHost == "laptop" then [
    {
      match.app_id = "^firefox$";
      default_maximize = true;
    }
  ] else [
    {
      match.app_id = "^(signal|WebCord|discord|vesktop)$";
      opacity = 0.9;
      default_output = profile.chatOutput;
      default_workspace = 5;
    }
    {
      match.app_id = "^(nautilus|Thunar|org\\.gnome\\.Nautilus)$";
      default_output = profile.chatOutput;
      default_workspace = 5;
    }
    {
      match.app_id = "^org\\.mozilla\\.Thunderbird$";
      default_output = profile.mailOutput;
      default_workspace = 7;
    }
  ];

  baseKeybinds = {
    "XF86AudioRaiseVolume" = "spawn:noctalia msg volume-up 1";
    "XF86AudioLowerVolume" = "spawn:noctalia msg volume-down 1";
    "XF86AudioMute" = "spawn:noctalia msg volume-mute";
    "XF86AudioMicMute" = "spawn:noctalia msg mic-mute";
    "Mod+grave" = "spawn:noctalia msg mic-mute";
    "XF86AudioMedia" = "spawn:playerctl play-pause";
    "XF86AudioPlay" = "spawn:playerctl play-pause";
    "XF86AudioPrev" = "spawn:playerctl previous";
    "XF86AudioNext" = "spawn:playerctl next";
    "Mod+T" = "spawn:foot";
    "Mod+Return" = {
      action = "spawn:foot";
      repeat = false;
    };
    "Mod+E" = "spawn:nemo --existing-window";
    "Mod+C" = "spawn:code";
    "Mod+B" = "spawn:firefox";
    "Print" = "spawn:noctalia msg screenshot-region";
    "Ctrl+Print" = "spawn:noctalia msg screenshot-fullscreen";
    "Alt+Print" = "spawn:noctalia msg screenshot-region";
    "Mod+Escape" = "spawn:noctalia msg panel-toggle session";
    "Mod+W" = "spawn:noctalia msg panel-toggle wallpaper";
    "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+Z" = "spawn:noctalia msg panel-toggle launcher /emo";
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Mod+X" = "spawn:noctalia msg bar-toggle";
    "Mod+Shift+W" = "spawn:noctalia msg desktop-widgets-toggle-edit";
    "Mod+Shift+T" = "spawn:noctalia msg panel-toggle test";
    "Mod+Shift+E" = "session-quit:skip-confirmation";
    "Mod+Q" = {
      action = "window-close";
      repeat = false;
    };
    "Mod+Space" = "window-toggle-floating";
    "Mod+Slash" = "window-consume-left";
    "Mod+MouseMiddle" = {
      action = "overview-toggle";
      repeat = false;
    };
    "Mod+O" = {
      action = "overview-toggle";
      repeat = false;
    };
    "Mod+R" = "window-cycle-width";
    "Mod+A" = "window-set-width:0.333";
    "Mod+S" = "window-set-width:0.5";
    "Mod+F" = "window-set-width:1.0";
    "Mod+Left" = "window-focus-left";
    "Mod+Down" = "window-focus-down";
    "Mod+Up" = "window-focus-up";
    "Mod+Right" = "window-focus-right";
    "Mod+H" = "window-focus-left";
    "Mod+J" = "window-focus-down";
    "Mod+K" = "window-focus-up";
    "Mod+L" = "window-focus-right";
    "Mod+Shift+Left" = "column-move-left";
    "Mod+Shift+Down" = "window-move-down";
    "Mod+Shift+Up" = "window-move-up";
    "Mod+Shift+Right" = "column-move-right";
    "Mod+U" = "workspace-previous";
    "Mod+I" = "workspace-next";
    "Mod+Ctrl+Left" = "output-focus-left";
    "Mod+Ctrl+Down" = "output-focus-down";
    "Mod+Ctrl+Up" = "output-focus-up";
    "Mod+Ctrl+Right" = "output-focus-right";
    "Mod+Ctrl+H" = "output-focus-left";
    "Mod+Ctrl+J" = "output-focus-down";
    "Mod+Ctrl+K" = "output-focus-up";
    "Mod+Ctrl+L" = "output-focus-right";
    "Mod+1" = "workspace-switch:${workspaceSelectors.ws1}";
    "Mod+2" = "workspace-switch:${workspaceSelectors.ws2}";
    "Mod+3" = "workspace-switch:${workspaceSelectors.ws3}";
    "Mod+4" = "workspace-switch:${workspaceSelectors.ws4}";
    "Mod+5" = "workspace-switch:${workspaceSelectors.ws5}";
    "Mod+6" = "workspace-switch:${workspaceSelectors.ws6}";
    "Mod+7" = "workspace-switch:${workspaceSelectors.ws7}";
    "Mod+8" = "workspace-switch:${workspaceSelectors.ws8}";
    "Mod+9" = "workspace-switch:${workspaceSelectors.ws9}";
    "Mod+Shift+1" = "window-move-to-workspace:${workspaceSelectors.ws1}";
    "Mod+Shift+2" = "window-move-to-workspace:${workspaceSelectors.ws2}";
    "Mod+Shift+3" = "window-move-to-workspace:${workspaceSelectors.ws3}";
    "Mod+Shift+4" = "window-move-to-workspace:${workspaceSelectors.ws4}";
    "Mod+Shift+5" = "window-move-to-workspace:${workspaceSelectors.ws5}";
    "Mod+Shift+6" = "window-move-to-workspace:${workspaceSelectors.ws6}";
    "Mod+Shift+7" = "window-move-to-workspace:${workspaceSelectors.ws7}";
    "Mod+Shift+8" = "window-move-to-workspace:${workspaceSelectors.ws8}";
    "Mod+Shift+9" = "window-move-to-workspace:${workspaceSelectors.ws9}";
    "Mod+WheelUp" = "window-focus-left";
    "Mod+WheelDown" = "window-focus-right";
    "Mod+Shift+WheelUp" = "column-move-left";
    "Mod+Shift+WheelDown" = "column-move-right";
  } // profile.brightnessKeybinds;
in
{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [ "noctalia" ];
        mod_key = "Super";
        xwayland = true;
        show_cheatsheet = false;
        focus_on_activate = false;
        honor_restored_maximize = false;
      };

      environment = {
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "umbriel";
        XDG_SESSION_CLASS = "user";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      };

      colors = {
        background = "#16161DF0";
        text_primary = "#E0DEF4FF";
        text_muted = "#908CAAFF";
        accent_primary = "#9CCFD8FF";
        accent_secondary = "#31748FFF";
        warning = "#F6C177FF";
        error = "#EB6F92FF";
      };

      appearance = {
        prefer_no_csd = true;
        border_width = 1;
        outer_border_width = 0;
        corner_radius = 16;
        border_focused = "#9CCFD8FF";
        border_unfocused = "#524F67FF";
        outer_border_color = "#00000000";
        insert_hint_color = "#31748F80";
        backdrop_color = "#000000FF";
        animation_ms = 200;
        blur = {
          enabled = true;
          optimized = true;
          passes = 2;
          radius = 5;
          noise = 0.03;
          brightness = 0.9;
          contrast = 0.9;
          saturation = 1.0;
        };
        shadow = {
          enabled = true;
          softness = 20;
          offset_x = 0;
          offset_y = 10;
          color = "#00000088";
        };
      };

      overview = {
        zoom = 0.5;
        background_tint = "#524F6788";
        workspace_background = "#00000044";
      };

      layout = {
        mode = "scrolling";
        gap = 16;
        width_presets = [ 0.5 0.66667 1.0 ];
        scrolling = {
          direction = "horizontal";
          default_width_fraction = 1.0;
          center_underfull_strip = true;
        };
      };

      input = {
        keyboard.layout = "us";
        mouse = {
          accel_profile = "flat";
          sensitivity = 0.0;
          scroll_wheel_step = 60;
        };
        focus = {
          follows_mouse = true;
          follows_mouse_max_scroll = 0.0;
        };
      };

      keybinds = baseKeybinds;

      output = profile.outputs;

      window_rule = sharedWindowRules ++ hostWindowRules;

      layer_rule = [
        {
          match.namespace = ''^noctalia-(bar-[^"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^"]*)$'';
          blur = true;
          blur_ignore_alpha = 0.5;
          blur_popups = true;
        }
      ];
    };
  };
}