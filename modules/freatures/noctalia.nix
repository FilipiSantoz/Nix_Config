{...}: {
  homeModules = [
    ({inputs, ...}: {
      imports = [inputs.noctalia.homeModules.default];

      programs.noctalia = {
        enable = true;

        systemd.enable = true;

        settings = {
          theme = {
            mode = "dark";
            source = "builtin";
            builtin = "Catppuccin";
          };

          wallpaper = {
            enabled = true;
            default.path = "/home/santoz/Documents/Wallpapers/z.png";
          };
        };
      };
    })
  ];
}
