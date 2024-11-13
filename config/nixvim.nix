{ config, lib, ... }:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  colorschemes = {
    base16 = {
      colorscheme = lib.toLower config.colorScheme.name;
    };
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        custom_highlights = # Lua
          ''
            function(colors)
              return {
                BufferLineBufferSelected = { fg = colors.lavender },
                NavicText = { link = "@variable" },
                ["@property.css"] = { link = "@field" },
                ["@property.toml"] = { link = "@field" },
                ["@text.uri"] = { link = "String" },
                ["@tag.attribute"] = { link = "Function" },
                ["@tag.delimiter"] = { fg = colors.lavender },
                ["@function.builtin"] = { link = "Function" },
                ["@field"] = { fg = "#73daca" },
                ["@property"] = { link = "@field" },
              }
            end
          '';
      };
    };
  };
  plugins = {
    hmts.enable = true;
    lualine.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          "<C-Space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-e>" = [ "hide" ];
          "<CR>" = [
            "select_and_accept"
            "fallback"
          ];

          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];

          "<Tab>" = [
            "snippet_forward"
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "select_prev"
            "fallback"
          ];

          "<C-n>" = [
            "select_next"
            "fallback"
          ];
          "<C-p>" = [
            "select_prev"
            "fallback"
          ];
        };
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 200;
        };

        ghost_text.enabled = true;

        highlight.use_nvim_cmp_as_default = true;

        accept.auto_brackets.enabled = true;
        trigger.signature_help.enabled = true;
      };
    };
    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true;
        nixd.enable = true;
        lua_ls.enable = true;
      };
    };
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        auto_install = true;
        highlight.enable = true;
        # indent.enable = true;
        ensure_installed = [
          "nix"
          "lua"
          "gitignore"
          "gitcommit"
        ];
      };
      # folding = true;
    };
    mini = {
      enable = true;
      modules = {
        move = { };
        files = {
          windows.preview = true;
        };
        # indentscope = {
        #   delay = 50;
        #   symbol = "│";
        #   options.try_as_border= true;
        #   draw.animation = "";
        # };
        ai = { };
        surround = {
          mappings = {
            add = "gsa";
            delete = "gsd";
            find = "gsf";
            find_left = "gsF";
            highlight = "gsh";
            replace = "gsr";

            update_n_lines = "gsn";
          };
        };
        icons = { };
      };
    };
  };
}
