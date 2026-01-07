{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { nixpkgs, nixvim, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        # hostname = nixpkgs.lib.nixosSystem {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              #home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.users.w0op5 = ./home-manager/home.nix;
            }
          ];
        };
      };
    };
}
