{...}: {
  homeModules = [
    ({pkgs, ...}: {
      home.packages = with pkgs; [
        (llama-cpp.override {
          vulkanSupport = true;
        })
      ];
    })
  ];
}
