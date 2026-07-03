{ config, pkgs, lib, hmHost ? null, ... }:

let
  hostModule = ./hosts + "/${hmHost}.nix";
in {
  imports = lib.optional (hmHost != null && builtins.pathExists hostModule) hostModule;

  # Home Manager configuration for mdusome user
  home.username = "mdusome";
  home.homeDirectory = "/home/mdusome";
  home.stateVersion = "26.05";

  # XDG configuration files (converted from skel)
  xdg.configFile = {
    "foot/foot.ini".text = builtins.readFile ./skel/foot/foot.ini;
    "foot/dank-colors.ini".text = builtins.readFile ./skel/foot/dank-colors.ini;
    "niri/src/animations.kdl".text = builtins.readFile ./skel/niri/src/animations.kdl;
    "niri/src/input.kdl".text = builtins.readFile ./skel/niri/src/input.kdl;
    "niri/src/layout.kdl".text = builtins.readFile ./skel/niri/src/layout.kdl;
    "niri/src/misc.kdl".text = builtins.readFile ./skel/niri/src/misc.kdl;
    "niri/src/spawn.kdl".text = builtins.readFile ./skel/niri/src/spawn.kdl;
    "noctalia/noctalia-config.toml".text = builtins.readFile ./skel/noctalia/noctalia-config.toml;
    "gtk-3.0/bookmarks".text = builtins.readFile ./skel/gtk-3.0/bookmarks;
    "gtk-3.0/gtk.css".text = builtins.readFile ./skel/gtk-3.0/gtk.css;
    "gtk-3.0/settings.ini".text = builtins.readFile ./skel/gtk-3.0/settings.ini;
  };
}
