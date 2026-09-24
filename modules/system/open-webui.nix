{ ... }: {
  nixosModules = [
    ({ pkgs, ... }: {
      services.open-webui = {
        enable = true;
        port = 3333;
        environment = {
          OPENAI_API_BASE_URLS = "http://127.0.0.1:3232/v1";
          OPENAI_API_KEY = "dummy";
        };
      };
      systemd.services.open-webui.wantedBy = pkgs.lib.mkForce [ ];
    })
  ];
}
