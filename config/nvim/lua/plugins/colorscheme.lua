return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      -- transparent_background = true,
      intergrations = {
        lualine = true,
      },
      highlight_overrides = {
        ["mocha"] = function(colors)
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
        end,
      },
    },
  },
}
