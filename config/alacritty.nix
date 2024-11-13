{ lib, pkgs, ... }:

{
  enable = true;
  package = pkgs.alacritty;
  settings = {
    window = {
      padding = {
        x = 4;
        y = 4;
      };
      dynamic_padding = true;
    };
    general = {
      live_config_reload = true;
    };
    font = lib.mkForce {
      size = 14;
    };
    mouse.hide_when_typing = true;
    cursor = {
      style = {
        shape = "Block";
        blinking = "On";
      };
      blink_interval = 350;
    };
  };
}
