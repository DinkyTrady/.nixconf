{ lib, config, pkgs, ... }:

let
  cfg = config.user;
in
{
  options.user = {
    enable 
      = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "kyra";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.${cfg.userName} = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
      shell = pkgs.fish;
      packages = with pkgs; [
        tree
        stow
      ];
    };
  };
}
