{
  # config,
  lib,
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua

      bash-language-server
      shellcheck
      shfmt

      typescript
      typescript-language-server
      eslint
      # vscode-js-debug
      nodePackages.prettier
      nodePackages.vscode-langservers-extracted

      clang
      clang-analyzer
      clang-tools

      jdt-language-server

      rust-analyzer
      # rustfmt

      taplo

      marksman
      markdownlint-cli2

      nil
      nixd
      nixfmt-rfc-style

      hyprlang
    ];

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig =
      let
        plugins = with pkgs.vimPlugins; [
          LazyVim
          conform-nvim
          dashboard-nvim
          dressing-nvim
          friendly-snippets
          gitsigns-nvim
          indent-blankline-nvim
          lualine-nvim
          neodev-nvim
          nui-nvim
          persistence-nvim
          nvim-lint
          nvim-lspconfig
          nvim-treesitter
          nvim-treesitter-textobjects
          nvim-ts-autotag
          nvim-ts-context-commentstring
          plenary-nvim
          telescope-nvim
          todo-comments-nvim
          which-key-nvim
          ultimate-autopair-nvim
          todo-comments-nvim
          telescope-file-browser-nvim
          rainbow-delimiters-nvim
          vim-repeat
          ts-comments-nvim
          trouble-nvim
          blink-cmp
          codesnap-nvim
          fidget-nvim
          flit-nvim
          grug-far-nvim
          harpoon2
          lazydev-nvim
          leap-nvim
          luvit-meta
          markdown-preview-nvim
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text
          nvim-navic
          nvim-nio
          nvim-jdtls
          SchemaStore-nvim
          cord-nvim
          mini-ai
          mini-indentscope
          mini-move
          mini-files
          mini-icons
          mini-surround
          mini-hipatterns
          {
            name = "catppuccin";
            path = catppuccin-nvim;
          }
        ];
        mkEntryFromDrv =
          drv:
          if lib.isDerivation drv then
            {
              name = "${lib.getName drv}";
              path = drv;
            }
          else
            drv;
        lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
      in
      # Lua
      ''
        require("lazy").setup({
          dev = {
            path = "${lazyPath}",
            patterns = { "." },
            fallback = true,
          },
          spec = {
            -- add LazyVim and import its plugins
            { "LazyVim/LazyVim", import = "lazyvim.plugins" },
            -- import any extras modules here
            { import = "lazyvim.plugins.extras.lang.typescript" },
            { import = "lazyvim.plugins.extras.lang.git" },
            { import = "lazyvim.plugins.extras.lang.json" },
            -- { import = "lazyvim.plugins.extras.lang.java" },
            { import = "lazyvim.plugins.extras.lang.markdown" },
            { import = "lazyvim.plugins.extras.lang.nix" },
            { import = "lazyvim.plugins.extras.lang.toml" },
            { import = "lazyvim.plugins.extras.linting.eslint" },
            { import = "lazyvim.plugins.extras.formatting.prettier" },
            { import = "lazyvim.plugins.extras.ui.mini-indentscope" },
            { import = "lazyvim.plugins.extras.coding.mini-surround" },
            { import = "lazyvim.plugins.extras.editor.mini-files" },
            { import = "lazyvim.plugins.extras.editor.mini-move" },
            { import = "lazyvim.plugins.extras.editor.leap" },
            { import = "lazyvim.plugins.extras.editor.harpoon2" },
            { import = "lazyvim.plugins.extras.dap.core" },
            { import = "lazyvim.plugins.extras.util.dot" },
            { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
            -- import/override with your plugins
            { import = "plugins" },
            -- disable auto install
            { "williamboman/mason-lspconfig.nvim", enabled = false },
            { "jay-babu/mason-nvim-dap.nvim", enabled = false },
            { "williamboman/mason.nvim", enabled = false },
            { "nvim-telescope/telescope-fzf-native-nvim", enabled = false },
            {
              "nvim-treesitter/nvim-treesitter",
              opts = function(_, opts)
                opts.ensure_installed = {}
              end,
            },
          },
          defaults = {
            lazy = false,
            version = false, -- always use the latest git commit
          },
          install = { colorscheme = { "catppuccin", "habamax" } },
          checker = { enabled = false }, -- disable auto check for plugin updates
          performance = {
            reset_packpath = false,
            rtp = {
              -- disable some rtp plugins
              disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
                "2html_plugin",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logipat",
                "netrw",
                "netrwSettings",
                "netrwFileHandlers",
                "matchit",
                "tar",
                "rrhelper",
                "spellfile_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "rplugin",
                "syntax",
                "synmenu",
                "optwin",
                -- "compiler",
                "bugreport",
                "ftplugin",
              },
            },
          },
        })
      '';
  };
  xdg.configFile."nvim/parser".source =
    let
      parsers = pkgs.symlinkJoin {
        name = "treesitter-parsers";
        paths =
          (pkgs.vimPlugins.nvim-treesitter.withPlugins (
            plugins: with plugins; [
              bash
              c
              cpp
              diff
              html
              hyprlang
              java
              javascript
              # javascriptreact
              # javascript.jsx
              jsdoc
              json
              json5
              jsonc
              lua
              luadoc
              luap
              markdown
              # markdown-toc
              markdown_inline
              # markdownlint-cli2
              nix
              printf
              python
              query
              regex
              rasi
              rust
              toml
              tsx
              typescript
              # typescriptreact
              # typescript.tsx
              vim
              vimdoc
              xml
              yaml
              git_config
              gitcommit
              git_rebase
              gitignore
              gitattributes
            ]
          )).dependencies;
      };
    in
    "${parsers}/parser";
  xdg.configFile."nvim/lua".source = ./lua;
}
