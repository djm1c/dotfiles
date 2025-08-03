return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatOpen<cr>", desc = "Open Copilot Chat" },
      { "<leader>cq", "<cmd>CopilotChatClose<cr>", desc = "Quit Copilot Chat" },
    },
  },
}
