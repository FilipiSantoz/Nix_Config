{...}: {
  nixosModules = [
    ({
      inputs,
      pkgs,
      ...
    }: {
      imports = [inputs.niri-flake.nixosModules.niri];

      niri-flake.cache.enable = true;
      security.polkit.enable = true;

      services.greetd = {
        enable = true;
        settings.default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd ${pkgs.niri}/bin/niri-session";
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
      environment.systemPackages = with pkgs; [vulkan-tools];
    })
  ];
}
