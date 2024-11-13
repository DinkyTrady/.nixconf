return {
  -- {
  --   "max397574/better-escape.nvim",
  --   enable = false,
  --   event = "InsertEnter",
  --   opts = {
  --     mappings = {
  --       i = {
  --         k = {
  --           k = "<Esc>",
  --           j = "<Esc>",
  --         },
  --       },
  --       c = {
  --         k = {
  --           k = "<Esc>",
  --           j = "<Esc>",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = "LazyFile",
    opts = {
      draw = { animation = require("mini.indentscope").gen_animation.none() },
    },
  },
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "LazyFile",
  },
  {
    "mistricky/codesnap.nvim",
    event = "LazyFile",
    build = "make",
    opts = {
      title = "",
      code_font_family = "JetBrainsMono Nerd Font",
      watermark = "",
      has_line_number = true,
      -- has_breadcrumbs = true,
      save_path = os.getenv("XDG_PICTURES_DIR") or (os.getenv("HOME") .. "/Pictures/codesnap")
    }
  }
}
