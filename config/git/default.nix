{ pkgs, ... }:

{
  programs = {
    git = {
      enable = true;
      package = pkgs.git;
      lfs.enable = true;
      userName = "DinkyTrady";
      userEmail = "DinkyTrady@kyra.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
    gh = {
      enable = true;
      package = pkgs.gh;
    };
    gh-dash = {
      enable = true;
      package = pkgs.gh-dash;
    };
  };
}
