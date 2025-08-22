local config = function()
	vim.g.codeium_disable_bindings = 1

	vim.keymap.set("i", "<C-a>", function()
		return vim.fn["codeium#Accept"]()
	end, { expr = true, silent = true })

	vim.keymap.set("n", "<leader>ce", ":CodeiumEnable<CR>", { desc = "Enable Codeium" })
	vim.keymap.set("n", "<leader>cd", ":CodeiumDisable<CR>", { desc = "Disable Codeium" })
end

return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	config = config,
}
