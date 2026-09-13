{...}: {
  homeModules = [
    ({pkgs, ...}: {
      programs.emacs = {
        enable = true;

        package = pkgs.emacs-pgtk.override {
          withNativeCompilation = true;
          withSQLite3 = true;
          withTreeSitter = true;
        };

        extraPackages = epkgs:
          with epkgs; [
            evil
            general
            magit
            avy
            use-package
            batppuccin
            vterm
            org
            projectile
            multiple-cursors
            exec-path-from-shell
            nerd-icons
          ];
      };
    })
  ];
}
