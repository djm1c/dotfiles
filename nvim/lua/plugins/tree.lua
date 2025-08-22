local config = function()
	vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

	require("nvim-tree").setup({
		filters = {
			dotfiles = true,
		},
		view = {
			adaptive_size = true,
		},
	})

	vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", { desc = "Toggle nvim-tree" })
	vim.keymap.set("n", "<leader>fnt", ":NvimTreeFocus<CR>", { desc = "Focus nvim-tree" })
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	config = config,
}
