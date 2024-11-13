{
  config,
  lib,
  pkgs,
  # inputs,
  ...
}:

{
  imports = [
    # inputs.nixvim.homeManagerModules.nixvim
    ../../config/nvim
    ../../config/git
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.

  home = {
    username = "kyra";
    homeDirectory = "/home/kyra";
    stateVersion = "24.11";
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      grimblast
      btop
      fzf
      ripgrep
      wl-clipboard-rs
      wtype
      tela-icon-theme

      nodejs

      nix-output-monitor
      nvd

      temurin-bin

      # ags
      # hyprpanel
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    file = { };
    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  wayland = {
    windowManager = {
      hyprland = import ../../config/hypr/hyprland.nix { inherit pkgs config; };
    };
  };

  programs = {
    alacritty = import ../../config/alacritty.nix { inherit lib config pkgs; };
    fish = import ../../config/fish.nix { inherit lib pkgs; };
    starship = import ../../config/starship.nix { inherit config pkgs; };
    nh = {
      enable = true;
      clean.enable = true;
      flake = ../../.;
    };
    rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = with pkgs; [
        rofi-emoji-wayland
        rofi-power-menu
      ];
      extraConfig = {
        modi = "run,window,drun,emoji,filebrowser";
        font = "JetBrainsMono Nerd Font 16";
        show-icons = true;
        terminal = "alacritty";
        icon-theme = "Tela-purple-dark";
      };
    };
    fd = {
      enable = true;
      extraOptions = [
        "--hyperlink"
      ];
      ignores = [
        ".git/"
        ".cache"
        ".config"
        ".local"
        ".nix-*"
      ];
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      git = true;
      icons = "always";
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    home-manager.enable = true;
  };
}
