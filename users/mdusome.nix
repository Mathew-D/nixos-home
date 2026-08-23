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
	"fuse"
    ];
    shell = pkgs.fish;
  };

}
