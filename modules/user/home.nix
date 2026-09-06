{...}: {
  homeModules = [
    ({pkgs, ...}: {
      home.packages = with pkgs; [
        # Normal Stack
        ripgrep
        eza
        playerctl
        fd
        lazygit
        wl-clipboard
        lm_sensors
        fastfetch
        opencode
        audacious
        chromium
        vlc
        pi-coding-agent
        shotcut
        gcc
        hextazy
        rocmPackages.rocm-smi
        btop-rocm
        tree-sitter
        glib

        alejandra
        shfmt
        lua-language-server
        nixd
        stylua
        marksman
        prettier
      ];

      xdg.userDirs = {
        enable = true;
        createDirectories = true;
        desktop = "$HOME/Desktop";
        documents = "$HOME/Documents";
        download = "$HOME/Downloads";
        music = "$HOME/Music";
        pictures = "$HOME/Pictures";
        videos = "$HOME/Videos";
        templates = "$HOME/Templates";
        publicShare = "$HOME/Public";
      };

      home.sessionVariables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "firefox";
        GDK_BACKEND = "wayland";
        QT_QPA_PLATFORM = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
      };

      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableZshIntegration = true;
      };

      # === GIT ===
      programs.git = {
        enable = true;
        settings = {
          user.name = "FilipiSantoz";
          user.email = "239681201+FilipiSantoz@users.noreply.github.com";
          init.defaultBranch = "main";
          core.editor = "nvim";
          pull.rebase = false;
        };
      };
      programs.home-manager.enable = true;
    })
  ];
}
