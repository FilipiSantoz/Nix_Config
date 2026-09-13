{...}: {
  homeModules = [
    ({pkgs, ...}: {
      home.packages = with pkgs; [
        # Normal Stack
        eza
        playerctl
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
        gnumake
        hextazy
        rocmPackages.rocm-smi
        btop-rocm
        tree-sitter
        glib
        foliate
        miro
        gnome-calculator

        statix
        alejandra
        shfmt
        lua-language-server
        nixd
        stylua
        marksman
        prettier
        prettierd
        eslint_d
        rustc
        rust-analyzer
        rustfmt
        cargo
        go
        gopls
        gotools
        golangci-lint
        shellcheck
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

      home = {
        sessionVariables = {
          BROWSER = "firefox";
          GDK_BACKEND = "wayland";
          QT_QPA_PLATFORM = "wayland";
          MOZ_ENABLE_WAYLAND = "1";
        };
        sessionPath = [
          "$HOME/.config/emacs/bin:$PATH"
        ];
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
          pull.rebase = false;
        };
      };
      programs.home-manager.enable = true;
    })
  ];
}
