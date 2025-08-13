local config = function()
	require("telescope").setup({
		pickers = {
			buffers = {
				initial_mode = "normal",
			},
		},
	})

	local keymap = vim.keymap

	keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope files" })
	keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope grep" })
	keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
	keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Telescope git status" })
	keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Telescope git commits" })
end

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = config,
}
