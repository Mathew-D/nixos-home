{ lib, ... }:
{
  xdg.configFile = {
    "niri/config.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/config-forest.kdl);
    "niri/src/binds.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/src/binds.kdl);
    "niri/src/rules.kdl".text = lib.mkForce (builtins.readFile ../skel/niri/src/rules.kdl);
  };
}
