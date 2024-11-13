{ lib, pkgs, ... }:

let
  pkgsFetch = pkgs.fetchFromGitHub;
in
{
  enable = true;
  interactiveShellInit = ''
    set fish_greeting

    enable_transience

    set -Ux CARGO_HOME ~/DevPkg/.cargo

    fish_add_path ~/DevPkg/.npm/bin
  '';
  # shellInitLast = ''
  # '';
  plugins = [
    # {
    #   name = "zoxide";
    #   src = pkgsFetch {
    #     owner = "kidonng";
    #     repo = "zoxide.fish";
    #     rev = "bfd5947bcc7cd01beb23c6a40ca9807c174bba0e";
    #     sha256 = "sha256-Hq9UXB99kmbWKUVFDeJL790P8ek+xZR5LDvS+Qih+N4=";
    #   };
    # }
    {
      name = "fzf";
      src = pkgsFetch {
        owner = "PatrickF1";
        repo = "fzf.fish";
        rev = "8920367cf85eee5218cc25a11e209d46e2591e7a";
        sha256 = "sha256-T8KYLA/r/gOKvAivKRoeqIwE2pINlxFQtZJHpOy9GMM=";
      };
    }
    {
      name = "autopair";
      src = pkgsFetch {
        owner = "jorgebucaran";
        repo = "autopair.fish";
        rev = "4d1752ff5b39819ab58d7337c69220342e9de0e2";
        sha256 = "sha256-qt3t1iKRRNuiLWiVoiAYOu+9E7jsyECyIqZJ/oRIT1A=";
      };
    }
    # {
    #   name = "async";
    #   src = pkgsFetch {
    #     owner = "acomagu";
    #     repo = "fish-async-prompt";
    #     rev = "316aa03c875b58e7c7f7d3bc9a78175aa47dbaa8";
    #     sha256 = "sha256-J7y3BjqwuEH4zDQe4cWylLn+Vn2Q5pv0XwOSPwhw/Z0=";
    #   };
    # }
    {
      name = "spoonge.fish";
      src = pkgsFetch {
        owner = "meaningful-ooo";
        repo = "sponge";
        rev = "384299545104d5256648cee9d8b117aaa9a6d7be";
        sha256 = "sha256-MdcZUDRtNJdiyo2l9o5ma7nAX84xEJbGFhAVhK+Zm1w=";
      };
    }
  ];
}
