{ ... }: {
  homeModules = [
    {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        installVimSyntax = true;
        settings = {
          window-padding-x = 0;
          window-padding-y = 0;
          "shell-integration-features" = "no-cursor";
          theme = "Duskfox";
          font-size = 12;
          palette = [
            "2=#94e871"
          ];

          font-family = "DepartureMono Nerd Font";
          background-opacity = 0.94;
          background-blur = true;
          title = "Ghostty";
          window-decoration = "none";
          "window-inherit-working-directory" = false;
          "working-directory" = "home";
          "window-padding-balance" = false;
          "window-padding-color" = "extend-always";

          cursor-style = "block";
          cursor-style-blink = true;
          "custom-shader-animation" = "always";
          "custom-shader" = [
            "shaders/cursor_tail.glsl"
          ];

        };
      };
    }
  ];
}
