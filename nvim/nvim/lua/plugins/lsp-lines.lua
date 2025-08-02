return {
  "ErichDonGubler/lsp_lines.nvim",
  event = "LspAttach",
  opts = {
    enable = true, -- Enable lsp_lines
  },
  config = function(_, opts)
    require("lsp_lines").setup(opts)

    -- Optionally, you can set up keymaps or other configurations here
    vim.keymap.set("n", "<leader>ll", "<cmd>LspLinesToggle<CR>", { desc = "[L]SP [L]ines Toggle" })
  end,
}
