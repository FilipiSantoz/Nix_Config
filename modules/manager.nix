{
  lib,
  config,
  inputs,
  ...
}: {
  options.homeModules = lib.mkOption {
    type = lib.types.listOf lib.types.deferredModule;
    default = [];
    description = "Home-manager modules dendritic";
  };

  options.nixosModules = lib.mkOption {
    type = lib.types.listOf lib.types.deferredModule;
    default = [];
    description = "System modules dendritic";
  };
  config = {
    flake.nixosConfigurations."lua" = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules =
        config.nixosModules
        ++ [
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};

            home-manager.users.santoz = {
              home.stateVersion = "26.05";
              imports = config.homeModules;
            };
          }
        ];
    };
  };
}
