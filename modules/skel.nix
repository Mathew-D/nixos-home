{ config, pkgs, ... }:

{
  environment.etc = {
    "skel/.config/foot/foot.ini".text = builtins.readFile ../home/skel/foot/foot.ini;
    "skel/.config/foot/dank-colors.ini".text = builtins.readFile ../home/skel/foot/dank-colors.ini;
    "skel/.config/foot/themes/noctalia".text = builtins.readFile ../home/skel/foot/themes/noctalia;
    "skel/.config/niri/config.kdl".text = builtins.readFile ../home/skel/niri/config.kdl;
    "skel/.config/niri/noctalia.kdl".text = builtins.readFile ../home/skel/niri/noctalia.kdl;
    "skel/.config/niri/src/animations.kdl".text = builtins.readFile ../home/skel/niri/src/animations.kdl;
    "skel/.config/niri/src/binds.kdl".text = builtins.readFile ../home/skel/niri/src/binds.kdl;
    "skel/.config/niri/src/input.kdl".text = builtins.readFile ../home/skel/niri/src/input.kdl;
    "skel/.config/niri/src/layout.kdl".text = builtins.readFile ../home/skel/niri/src/layout.kdl;
    "skel/.config/niri/src/misc.kdl".text = builtins.readFile ../home/skel/niri/src/misc.kdl;
    "skel/.config/niri/src/rules.kdl".text = builtins.readFile ../home/skel/niri/src/rules.kdl;
    "skel/.config/niri/src/spawn.kdl".text = builtins.readFile ../home/skel/niri/src/spawn.kdl;
    "skel/.config/noctalia/noctalia-config.toml".text = builtins.readFile ../home/skel/noctalia/noctalia-config.toml;
    "skel/.config/gtk-3.0/bookmarks".text = builtins.readFile ../home/skel/gtk-3.0/bookmarks;
    "skel/.config/gtk-3.0/gtk.css".text = builtins.readFile ../home/skel/gtk-3.0/gtk.css;
    "skel/.config/gtk-3.0/noctalia.css".text = builtins.readFile ../home/skel/gtk-3.0/noctalia.css;
    "skel/.config/gtk-3.0/settings.ini".text = builtins.readFile ../home/skel/gtk-3.0/settings.ini;
  };
}