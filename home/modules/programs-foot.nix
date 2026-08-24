{ ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "foot";
        "resize-delay-ms" = 50;
        font = "RobotoMono Nerd Font Mono:size=12";
        "selection-target" = "clipboard";
        include = "~/.config/foot/themes/noctalia";
        shell = "/run/current-system/sw/bin/fish";
        pad = "10x20";
      };
      csd = {
        preferred = "none";
        size = 24;
      };
      scrollback = {
        lines = 10000;
      };
      "colors-dark" = {
        alpha = "0.9";
      };
      "mouse-bindings" = {
        "primary-paste" = "none";
        "select-begin-block" = "none";
        "select-extend-character-wise" = "none";
        "clipboard-copy" = "Control+BTN_LEFT";
        "clipboard-paste" = "Control+BTN_RIGHT";
      };
      "key-bindings" = {
        "clipboard-copy" = "Control+Shift+c";
        "clipboard-paste" = "Control+Shift+v";
      };
    };
  };
}