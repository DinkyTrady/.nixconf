-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
autocmd({ "FileType" }, {
	pattern = { "lua", "html", "css" },
	callback = function()
		vim.b.autoformat = false
	end,
})

autocmd("LspAttach", {
	callback = function()
		require("config.lsp-settings")
	end,
})

local status, lvim_util = pcall(require, "lazyvim.util")
if not status then
	return
end

vim.api.nvim_set_hl(0, "CursorLine", { bg = nil })
vim.api.nvim_command("redraw")

lvim_util.lsp.on_attach(function(client, buffer)
	if client.supports_method("textDocument/documentSymbol") then
		function sethl(bufnr, name, table)
			vim.api.nvim_set_hl(bufnr, name, table)
		end
	end
end)
-- "NavicIconsFile"         "NavicIconsModule"       "NavicIconsNamespace"    "NavicIconsPackage"      "NavicIconsClass"        "NavicIconsMethod"       "NavicIconsProperty"     "NavicIconsField"        "NavicIconsConstructor"  "NavicIconsEnum"         "NavicIconsInterface"    "NavicIconsFunction"     "NavicIconsVariable"     "NavicIconsConstant"     "NavicIconsString"       "NavicIconsNumber"       "NavicIconsBoolean"      "NavicIconsArray"        "NavicIconsObject"       "NavicIconsKey"          "NavicIconsNull"         "NavicIconsEnumMember"   "NavicIconsStruct"       "NavicIconsEvent"        "NavicIconsOperator"     "NavicIconsTypeParameter" "NavicText"              "NavicSeparator"
