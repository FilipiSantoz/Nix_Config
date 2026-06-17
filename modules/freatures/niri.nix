{...}: {
  homeModules = [
    ({pkgs, ...}: {
      home.packages = with pkgs; [
        xwayland-satellite
        bibata-cursors
      ];

      programs.niri = {
        package = pkgs.niri-unstable;

        settings = {
          input = {
            keyboard = {
              xkb = {
                layout = "br";
                variant = "abnt2";
              };
              numlock = true;
            };
            touchpad = {
              tap = true;
              natural-scroll = true;
            };
          };

          environment = {
            NIXOS_OZONE_WL = "1";
            MOZ_ENABLE_WAYLAND = "1";
            QT_QPA_PLATFORM = "wayland";
            GDK_BACKEND = "wayland";
          };

          binds = {
            "Mod+Return".action.spawn = "kitty";
            "Mod+B".action.spawn = "firefox";
            "Mod+W".action.close-window = {};
            "Mod+Shift+E".action.quit = {};
            "Mod+N".action.spawn = ["kitty" "nvim"];
            "Mod+Y".action.spawn = ["kitty" "yazi"];

            # === LAYOUT CONTROLS ===
            "Mod+R".action.switch-preset-column-width = {};
            "Mod+Shift+R".action.switch-preset-column-width-back = {};
            "Mod+T".action.switch-preset-window-height = {};
            "Mod+Shift+T".action.switch-preset-window-height-back = {};
            "Mod+F".action.maximize-column = {};
            "Mod+O".action.toggle-overview = {};

            # === Change Workspaces ===
            "Mod+1".action.focus-workspace = 1;
            "Mod+2".action.focus-workspace = 2;
            "Mod+3".action.focus-workspace = 3;
            "Mod+4".action.focus-workspace = 4;
            "Mod+5".action.focus-workspace = 5;
            "Mod+6".action.focus-workspace = 6;
            "Mod+7".action.focus-workspace = 7;
            "Mod+8".action.focus-workspace = 8;
            "Mod+9".action.focus-workspace = 9;

            # === Window Move ===
            "Mod+left".action.focus-column-left = {};
            "Mod+Right".action.focus-column-right = {};
            "Mod+Up".action.focus-window-up = {};
            "Mod+Down".action.focus-window-down = {};
            "Mod+H".action.focus-column-left = {};
            "Mod+L".action.focus-column-right = {};
            "Mod+K".action.focus-window-up = {};
            "Mod+J".action.focus-window-down = {};
            "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
            "Mod+Shift+WheelScrollUp".action.focus-column-left = {};

            # === Change Window  ===
            "Mod+Ctrl+left".action.move-column-left = {};
            "Mod+Ctrl+Right".action.move-column-right = {};
            "Mod+Ctrl+Up".action.move-window-up = {};
            "Mod+Ctrl+Down".action.move-window-down = {};
            "Mod+Ctrl+L".action.move-column-left = {};
            "Mod+Ctrl+H".action.move-column-right = {};
            "Mod+Ctrl+K".action.move-window-up = {};
            "Mod+Ctrl+J".action.move-window-down = {};

            # === Move To Workspaces ===
            "Mod+Ctrl+1".action.move-column-to-workspace = 1;
            "Mod+Ctrl+2".action.move-column-to-workspace = 2;
            "Mod+Ctrl+3".action.move-column-to-workspace = 3;
            "Mod+Ctrl+4".action.move-column-to-workspace = 4;
            "Mod+Ctrl+5".action.move-column-to-workspace = 5;
            "Mod+Ctrl+6".action.move-column-to-workspace = 6;
            "Mod+Ctrl+7".action.move-column-to-workspace = 7;
            "Mod+Ctrl+8".action.move-column-to-workspace = 8;
            "Mod+Ctrl+9".action.move-column-to-workspace = 9;

            # === Scroll Vertical ===
            "Mod+WheelScrollDown".action.focus-workspace-down = {};
            "Mod+WheelScrollUp".action.focus-workspace-up = {};
            "Mod+Ctrl+WheelScrollDown".action.move-column-to-workspace-down = {};
            "Mod+Ctrl+WheelScrollUp".action.move-column-to-workspace-up = {};

            # === Noctalia Integration ===
            "Mod+Shift+S".action.spawn = ["noctalia" "msg" "screenshot-region" "wlr-screencopy"];
            "Mod+Space".action.spawn = ["noctalia" "msg" "panel-toggle" "launcher"];
            "Mod+S".action.spawn = ["noctalia" "msg" "panel-toggle" "control-center"];
            "Mod+C".action.spawn = ["noctalia" "msg" "settings-toggle"];
            "Mod+Escape".action.spawn = ["noctalia" "msg" "panel-toggle" "session"];
            "XF86AudioRaiseVolume".action.spawn = ["noctalia" "msg" "volume-up"];
            "XF86AudioLowerVolume".action.spawn = ["noctalia" "msg" "volume-down"];
            "XF86AudioMute".action.spawn = ["noctalia" "msg" "volume-mute"];
            "XF86AudioMicMute".action.spawn = ["noctalia" "msg" "mic-mute"];

            # === Media Controls ===
            "XF86AudioPlay".action.spawn = ["playerctl" "play-pause"];
            "XF86AudioStop".action.spawn = ["playerctl" "stop"];
            "XF86AudioPrev".action.spawn = ["playerctl" "previous"];
            "XF86AudioNext".action.spawn = ["playerctl" "next"];
          };

          layout = {
            gaps = 10;
            background-color = "transparent";

            focus-ring = {
              enable = true;
              width = 2;
              active.color = "#BB99E8";
            };

            shadow = {
              enable = true;
              color = "#00000070";
              softness = 22;
              spread = 8;
            };
            preset-column-widths = [
              {proportion = 1. / 3.;}
              {proportion = 1. / 2.;}
              {proportion = 2. / 3.;}
              {proportion = 1. / 1.;}
            ];

            preset-window-heights = [
              {proportion = 1. / 3.;}
              {proportion = 1. / 2.;}
              {proportion = 2. / 3.;}
              {proportion = 1. / 1.;}
            ];

            default-column-width = {
              proportion = 0.5;
            };
          };
          window-rules = [
            {
              clip-to-geometry = true;
              geometry-corner-radius = {
                top-left = 12.0;
                top-right = 12.0;
                bottom-left = 12.0;
                bottom-right = 12.0;
              };
            }
            {
              matches = [{app-id = "^kitty";}];
              draw-border-with-background = false;
            }
            {
              matches = [
                {app-id = "^firefox";}
              ];
              open-maximized = true;
            }
          ];
          layer-rules = [
            {
              matches = [{namespace = "^noctalia-backdrop";}];
              place-within-backdrop = true;
            }
          ];
          cursor = {
            size = 24;
            theme = "Bibata-Modern-Ice";
          };
          hotkey-overlay.skip-at-startup = true;
        };
      };
    })
  ];
}
