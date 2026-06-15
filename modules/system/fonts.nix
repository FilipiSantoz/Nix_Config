{...}: {
  nixosModules = [
    ({pkgs, ...}: {
      fonts.packages = with pkgs; [
        nerd-fonts.departure-mono
        noto-fonts
        noto-fonts-cjk-sans
      ];
    })
  ];
}
