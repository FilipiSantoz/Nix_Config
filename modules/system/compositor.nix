{...}: {
  nixosModules = [
    ({
      inputs,
      config,
      pkgs,
      ...
    }: {
      imports = [inputs.niri-flake.nixosModules.niri];
      nixpkgs.overlays = [inputs.niri-flake.overlays.niri];

      programs.niri.enable = true;
      programs.niri.package = pkgs.niri-unstable;
      niri-flake.cache.enable = true;
      security.polkit.enable = true;

      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${config.programs.niri.package}/bin/niri-session";
          user = "greeter";
        };
      };
      xdg.portal = {
        enable = true;
        xdgOpenUsePortal = true;
        extraPortals = [pkgs.xdg-desktop-portal-gtk];
        config = {
          niri.default = ["gtk"];
          common.default = ["gtk"];
        };
      };
      environment.systemPackages = with pkgs; [vulkan-tools radeontop];
    })
  ];
}
