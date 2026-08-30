{...}: {
  homeModules = [
    ({pkgs, ...}: {
      home.packages = with pkgs; [
        # Normal Stack
        ripgrep
        eza
        btop
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
        nasm
        gcc
        hextazy
        rocmPackages.rocm-smi

        # Dap
        vscode-extensions.vadimcn.vscode-lldb
        lldb
        delve

        # Code formater and lsp
        go
        djlint
        alejandra
        rustfmt
        shfmt
        lua-language-server
        gopls
        nixd
        rust-analyzer
        clang-tools
        prettier
        stylua
        cargo
        asm-lsp
        marksman
        # Wrapper que expõe o codelldb no PATH
        (pkgs.writeShellScriptBin "codelldb" ''
          exec ${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb "$@"
        '')
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
