{ lib, ... }:
{
  xdg.configFile = {
    "niri/config.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/config-laptop.kdl);
    "niri/src/binds.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/src/binds-laptop.kdl);
    "niri/src/rules.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/src/rules-laptop.kdl);
  };
}
