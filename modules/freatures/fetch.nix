{...}: {
  homeModules = [
    ({inputs, ...}: {
      imports = [inputs.areofyl-fetch.homeModules.deafult];

      programs.fetch = {
        enable = true;
        labelColor = "cyan";
        light = "top-left";
        spin = "xy";
        speed = 1.0;
      };
    })
  ];
}
