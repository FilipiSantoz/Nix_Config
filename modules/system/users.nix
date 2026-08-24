{...}: {
  nixosModules = [
    ({pkgs, ...}: {
      users.users.santoz = {
        isNormalUser = true;
        shell = pkgs.zsh;
        extraGroups = ["wheel" "networkmanager" "video" "audio" "input" "docker"];
      };
      programs.zsh.enable = true;
    })
  ];
}
