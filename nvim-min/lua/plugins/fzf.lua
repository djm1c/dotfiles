local config = function()
    require("fzf-lua").setup()

    vim.keymap.set("n", "<leader>ff", ":Fzf files<CR>", { desc = "Search files" }) 
    vim.keymap.set("n", "<leader>fg", ":Fzf grep_project<CR>", { desc = "Grep project" }) 
    vim.keymap.set("n", "<leader>fb", ":Fzf buffers<CR>", { desc = "Search buffers" }) 
end

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = config
}
