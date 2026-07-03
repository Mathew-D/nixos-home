{ pkgs, ... }:

{
  users.users.mdusome = {
    isNormalUser = true;
    description = "Main user";
     extraGroups = [
      "audio"
      "input"
      "networkmanager"
      "video"
      "wheel"
      "gamemode"
    ];
    shell = pkgs.fish;
  };

  programs.git = {
    enable = true;
    userName = "Mathew-D";
    userEmail = "mathew_dusome@kprdsb.ca";
  };

  programs.home-manager.enable = true;

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "adwaita";
  };

  
}
