{ ... }: {
  homeModules = [
    {
      programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        installVimSyntax = true;
        settings = {
          "shell-integration-features" = "no-cursor";
          theme = "Nightfox";
          font-size = 12;
          font-family = "DepartureMono Nerd Font";
          background-opacity = 0.94;
          background-blur = true;
          title = "Ghostty";
          window-decoration = "none";
          "window-inherit-working-directory" = false;
          "working-directory" = "home";

          cursor-style = "block";
          cursor-style-blink = true;
          "custom-shader-animation" = "always";
          "custom-shader" = [
            "shaders/cursor_tail.glsl"
            "shaders/ripple_cursor.glsl"
          ];

        };
      };
    }
  ];
}
