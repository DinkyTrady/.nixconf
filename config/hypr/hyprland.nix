{ pkgs, ... }:

{
  enable = true;
  settings = {
    "$mod" = "SUPER";
    "$term" = "alacritty";
    "$menu" = "rofi -show drun";
    monitor = "eDP-1,1920x1080@144,auto,1";
    # exec-once = "${pkgs.hyprpanel}/bin/hyprpanel";
    xwayland = {
      force_zero_scaling = true;
    };
    general = {
      border_size = 2;
      allow_tearing = false;
      layout = "dwindle";
    };
    decoration = {
      blur = {
        enabled = false;
      };
    };
    animations = {
      first_launch_animation = false;
    };
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };
    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
    };
    input = {
      follow_mouse = 1;
      touchpad = {
        natural_scroll = true;
        middle_button_emulation = true;
      };
    };
    device = {
      name = "epic-mouse-v1";
      sensitivity = -0.5;
    };
    bind =
      [
        "$mod, Q, exec, $term"
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod SHIFT, F, fullscreen, 0"
        "$mod, R, exec, $menu"
        "$mod, P, pseudo, "
        "$mod, V, togglesplit, "

        # move window focus
        "$mod, h, movefocus, l"
        "$mod, j, movefocus, d"
        "$mod, k, movefocus, u"
        "$mod, l, movefocus, r"

        # move window
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, j, movewindow, d"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, l, movewindow, r"
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          x:
          let
            ws =
              let
                c = (x + 1) / 10;
              in
              builtins.toString (x + 1 - (c * 10));
          in
          [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        ) 10
      ));
    bindel = [
      ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
    ];
    bindl = [
      ", XF86AudioNext, exec, pkayerctl next"
      ", XF86AudioPause, exec, pkayerctl play-pause"
      ", XF86AudioPlay, exec, pkayerctl play-pause"
      ", XF86AudioPrev, exec, pkayerctl previous"
    ];
    windowrulev2 = [
      "float,class:(float)"
      "size 1280 800,class:(float)"

      "float,class:(com.gabm.satty)"
      "size 1280 800,class:(com.gabm.satty)"

      "suppressevent maximize, class:."

      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
