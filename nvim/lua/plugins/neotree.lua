return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },

  vim.keymap.set("n", "<leader>nt", function()
    require("neo-tree.command").execute({
      toggle = true,
      dir = vim.loop.cwd(),
    })
  end, { desc = "Toggle NeoTree" }),
}
