{ pkgs, ... }:

{
  users.users.school = {
    isNormalUser = true;
    description = "School user";
    extraGroups = [
      "audio"
      "input"
      "networkmanager"
      "video"
      "wheel"
      "fuse"
    ];
    shell = pkgs.fish;
  };
}
