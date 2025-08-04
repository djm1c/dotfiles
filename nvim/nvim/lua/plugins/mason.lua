return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- Can use lsp names instead of Mason names
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "basedpyright",
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        "stylua",
        "ruff",
      },
    })
  end,
}
