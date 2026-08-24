{ inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      bar = {
        order = [ "Main" ];

        Main = {
          background_opacity = 0.66999995708465576;
          capsule_opacity = 0.0;
          center = [ "active_window" "media" ];
          contact_shadow = true;
          end = [ "tray" "group:g1" "notifications" "clipboard" "group:g2" "network" "caffeine" "clock" "control-center" ];
          margin_edge = 5;
          margin_ends = 0;
          padding = 12;
          reserve_space = true;
          scale = 1.2000000476837158;
          start = [ "launcher" "taskbar" ];
          thickness = 31;
          capsule_group = [
            {
              fill = "surface_variant";
              id = "g1";
              members = [ "ram" "cpu" "temp" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 6.0;
            }
            {
              fill = "surface_variant";
              id = "g2";
              members = [ "volume" "input_volume" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 6.0;
            }
          ];
        };
      };

      battery.device."/org/freedesktop/UPower/devices/battery_hidpp_battery_0" = {
        warning_threshold = 55;
      };

      calendar = {
        enabled = true;
      };

      control_center = {
        sidebar = "full";
        sidebar_section = "full";
        shortcuts = [
          { type = "caffeine"; }
          { type = "notification"; }
        ];
      };

      desktop_widgets = {
        enabled = false;
      };

      dock = {
        active_monitor_only = true;
        enabled = false;
        show_instance_count = true;
        show_running = true;
      };

      idle = {
        behavior_order = [ "lock" "screen-off" ];
        pre_action_fade_seconds = 10;
        behavior = {
          lock = {
            action = "lock";
            command = "noctalia:screen-lock";
            enabled = true;
            timeout = 600;
          };

          "screen-off" = {
            action = "screen_off";
            command = "noctalia:dpms-off";
            enabled = true;
            resume_command = "noctalia:dpms-on";
            timeout = 660;
          };
        };
      };

      location = {
        address = "Bowmanville. Canada";
      };

      lockscreen = {
        blur_intensity = 0.0;
        tint_intensity = 0.0;
      };

      lockscreen_widgets = {
        enabled = false;
        schema_version = 1;
        widget_order = [
          "lockscreen-login-box@DP-1"
          "lockscreen-login-box@DP-3"
          "lockscreen-login-box@DP-2"
          "lockscreen-login-box@HDMI-A-1"
        ];

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget = {
          "lockscreen-login-box@DP-1" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 1280.0;
            cy = 1321.0;
            output = "DP-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          "lockscreen-login-box@DP-2" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 840.0;
            cy = 931.0;
            output = "DP-2";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          "lockscreen-login-box@DP-3" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 960.0;
            cy = 961.0;
            output = "DP-3";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };

          "lockscreen-login-box@HDMI-A-1" = {
            box_height = 70.0;
            box_width = 400.0;
            cx = 840.0;
            cy = 931.0;
            output = "HDMI-A-1";
            rotation = 0.0;
            type = "login_box";
            settings = {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
          };
        };
      };

      osd = {
        position = "top_right";
        kinds = {
          media = false;
        };
      };

      shell = {
        clipboard_auto_paste = "off";
        clipboard_confirm_clear_history = false;
        clipboard_image_action_command = "satty -f -";
        font_family = "Noto Sans";
        lang = "en";
        password_style = "random";
        polkit_agent = true;
        screen_time_enabled = true;
        settings_show_advanced = true;
        telemetry_enabled = true;
        time_format = "{:%-I:%M %p}";

        panel = {
          control_center_placement = "floating";
          session_placement = "centered";
          transparency_mode = "glass";
          wallpaper_placement = "floating";
        };

        screenshot = {
          copy_to_clipboard = true;
          freeze_screen = true;
          pipe_command = "satty -f -";
        };

        session.actions = [
          {
            action = "lock";
            enabled = true;
            shortcut = "1";
            variant = "default";
          }
          {
            action = "logout";
            enabled = true;
            shortcut = "2";
            variant = "default";
          }
          {
            action = "suspend";
            enabled = false;
            shortcut = "3";
            variant = "default";
          }
          {
            action = "reboot";
            enabled = true;
            shortcut = "4";
            variant = "default";
          }
          {
            action = "shutdown";
            enabled = true;
            shortcut = "5";
            variant = "destructive";
          }
        ];
      };

      system.monitor = {
        gpu_poll_seconds = 5;
      };

      theme = {
        builtin = "Noctalia";
        source = "community";
        wallpaper_scheme = "m3-content";
        templates = {
          builtin_ids = [ "btop" "foot" "gtk3" "gtk4" "niri" "qt" ];
          community_ids = [ "vscode" ];
        };
      };

      wallpaper = {
        directory = "/home/mdusome/images";
      };

      weather = { };

      widget = {
        battery = {
          device = "/org/freedesktop/UPower/devices/battery_hidpp_battery_0";
        };

        clock = {
          format = "{:%a, %b %-d  %-I:%M %p }";
          vertical_format = "{:%a, %b %-d \\n %-I:%M %p }";
        };

        cpu = {
          show_value = false;
        };

        input_volume = {
          show_label = false;
        };

        network = {
          show_label = false;
        };

        ram = {
          show_value = false;
        };

        taskbar = {
          group_by_workspace = true;
          workspace_label_placement = "centered";
        };

        temp = {
          show_value = false;
        };

        volume = {
          show_label = false;
        };
      };
    };
  };
}