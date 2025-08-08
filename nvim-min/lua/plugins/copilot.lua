local config = function()
	vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Copilot: Enable" })
	vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Copilot: Disable" })

	vim.keymap.set("i", "<C-a>", 'copilot#Accept("\\<CR>")', {
		expr = true,
		replace_keycodes = false,
	})

	vim.g.copilot_no_tab_map = true
end

return {
	"github/copilot.vim",
	config = config,
}
