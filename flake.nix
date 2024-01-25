{
  description = "rtft's NixOS config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    # hardware.url = "github:nixos/nixos-hardware";

    # nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    # bling = { url = "github:BlingCorp/bling"; flake = false; };
    # rubato = { url = "github:andOrlando/rubato"; flake = false; };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixpkgs-f2k,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      # Thinkpad X1 yoga
      redwood = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./hosts/redwood];
      };
      # VM 
      sequoia = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
        ./hosts/sequoia
	      # {nixpkgs.overlays = [ nixpkgs-f2k.overlays.window-managers ];}
	      ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "rain@redwood" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = {inherit inputs outputs;};
        # > Our main home-manager configuration file <
        modules = [./home/home.nix];
      };
      "rain@sequoia" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; 
        extraSpecialArgs = {inherit inputs outputs;};
        modules = [./home/home.nix];
      };
    };
  };
}
