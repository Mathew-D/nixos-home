{ config, pkgs, ... }:

{
  # Home Manager configuration for mdusome user
  home.username = "mdusome";
  home.homeDirectory = "/home/mdusome";
  home.stateVersion = "26.05";

  # XDG configuration files (converted from skel)
  xdg.configFile = {
    "foot/foot.ini".text = builtins.readFile ../modules/skel/foot/foot.ini;
    "foot/dank-colors.ini".text = builtins.readFile ../modules/skel/foot/dank-colors.ini;
    "foot/themes/noctalia".text = builtins.readFile ../modules/skel/foot/themes/noctalia;
    "niri/config.kdl".text = builtins.readFile ../modules/skel/niri/config.kdl;
    "niri/noctalia.kdl".text = builtins.readFile ../modules/skel/niri/noctalia.kdl;
    "niri/src/animations.kdl".text = builtins.readFile ../modules/skel/niri/src/animations.kdl;
    "niri/src/binds.kdl".text = builtins.readFile ../modules/skel/niri/src/binds.kdl;
    "niri/src/input.kdl".text = builtins.readFile ../modules/skel/niri/src/input.kdl;
    "niri/src/layout.kdl".text = builtins.readFile ../modules/skel/niri/src/layout.kdl;
    "niri/src/misc.kdl".text = builtins.readFile ../modules/skel/niri/src/misc.kdl;
    "niri/src/rules.kdl".text = builtins.readFile ../modules/skel/niri/src/rules.kdl;
    "niri/src/spawn.kdl".text = builtins.readFile ../modules/skel/niri/src/spawn.kdl;
    "noctalia/noctalia-config.toml".text = builtins.readFile ../modules/skel/noctalia/noctalia-config.toml;
    "gtk-3.0/bookmarks".text = builtins.readFile ../modules/skel/gtk-3.0/bookmarks;
    "gtk-3.0/gtk.css".text = builtins.readFile ../modules/skel/gtk-3.0/gtk.css;
    "gtk-3.0/noctalia.css".text = builtins.readFile ../modules/skel/gtk-3.0/noctalia.css;
    "gtk-3.0/settings.ini".text = builtins.readFile ../modules/skel/gtk-3.0/settings.ini;
  };
}
