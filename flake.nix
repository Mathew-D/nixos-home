{
  description = "NixOS system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  noctalia-greeter = {
    url = "github:noctalia-dev/noctalia-greeter";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  rift = {
    url = "github:Mathew-D/rift-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  
  pcloud = {
    url = "github:Mathew-D/pcloud-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  ts3-noweb.url = "github:Jokler/ts3client-noweb-nix";
  
  devin = {
    url = "github:Mathew-D/rift-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  noctalia = {
    url = "github:noctalia-dev/noctalia";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  };

outputs = { self, nixpkgs, ... }@inputs:
  let
    system = "x86_64-linux";
    
    mkHost = name: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [ ./hosts/${name}.nix ];
    };

    hosts = [ "main" "forest" ];
  in {
    nixosConfigurations = builtins.listToAttrs (
      map (name: {
        name = name;
        value = mkHost name;
      }) hosts
    );
  };
}
