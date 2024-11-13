return {
	-- {
	-- "nvim-java/nvim-java",
	-- enable = true,
	-- ft = "java",
	-- config = false,
	-- dependencies = {
	{
		"neovim/nvim-lspconfig",
		init = function()
			local keys = require("lazyvim.plugins.lsp.keymaps").get()
			keys[#keys + 1] = { "<C-k>", false, mode = "i" }
		end,
		opts = {
			servers = {
				nixd = {},
				nil_ls = {
					settings = {
						nix = {
							flake = {
								autoArchive = true,
							},
						},
					},
				},
			},
			-- setup = {
			-- 	jdtls = function()
			-- 		require("java").setup({
			-- 			spring_boot_tools = {
			-- 				enable = false,
			-- 			},
			-- 			jdk = {
			-- 				auto_install = false,
			-- 			},
			-- 		})
			-- 	end,
			-- },
		},
	},
	-- },
	-- },
	{
		"j-hui/fidget.nvim",
		tag = "v1.4.5",
		event = "LazyFile",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
}
