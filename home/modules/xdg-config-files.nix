{ ... }:
{
  # XDG configuration files (converted from skel)
  xdg.configFile = {
    "niri/src/animations.kdl".text = builtins.readFile ../skel/niri/src/animations.kdl;
    "niri/machines/forest.kdl".text = builtins.readFile ../skel/niri/machines/forest.kdl;
    "niri/machines/main.kdl".text = builtins.readFile ../skel/niri/machines/main.kdl;
    "niri/machines/laptop.kdl".text = builtins.readFile ../skel/niri/machines/laptop.kdl;
    "niri/src/input.kdl".text = builtins.readFile ../skel/niri/src/input.kdl;
    "niri/src/layout.kdl".text = builtins.readFile ../skel/niri/src/layout.kdl;
    "niri/src/misc.kdl".text = builtins.readFile ../skel/niri/src/misc.kdl;
    "niri/src/spawn.kdl".text = builtins.readFile ../skel/niri/src/spawn.kdl;
    "noctalia/noctalia-config.toml".text = builtins.readFile ../skel/noctalia/noctalia-config.toml;
  };
}