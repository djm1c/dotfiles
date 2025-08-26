-- center screen when jumping
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- splitting & resizing
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "+", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "_", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "-", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "=", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- better J behavior
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- quick config editing
vim.keymap.set("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit config" })

-- fast quit
vim.keymap.set("n", "<leader>Q", function()
	if vim.bo.modified then
		vim.cmd("wa")
	end
	vim.cmd("qa!")
end, { desc = "Fast quit all windows" })

-- find and replace
local replace_cmd = "hy:%s/<C-r>h//gc<left><left><left>"
vim.keymap.set("v", "<C-r>", '"' .. replace_cmd, { desc = "Find and replace" })

-- inlay hints
vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)
