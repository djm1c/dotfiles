local config = function()
	require("diffview").setup({})

	vim.keymap.set("n", "<leader>dvo", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
	vim.keymap.set("n", "<leader>dvc", ":DiffviewClose<CR>", { desc = "Close Diffview" })
end

return {
	"sindrets/diffview.nvim",
	config = config,
}
