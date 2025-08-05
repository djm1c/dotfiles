return {
  {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "SmiteshP/nvim-navbuddy",
      "SmiteshP/nvim-navic",
      -- Useful status updates for LSP
      -- Note: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
      },

      -- Additional lua configuration. Setup before setting up lspconfig for lua_ls.
      { "folke/lazydev.nvim", ft = "lua", opts = {} },
    },
    opts = {
      diagnostics = {
        float = {
          source = "always",
        },
        virtual_text = false,
      },
      -- autoformat = true,
      servers = {
        ruff = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = "Replace" },
              format = { enable = false },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- See: https://neovim.io/doc/user/lsp.html#lsp-attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my.lsp", {}),
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
          local bufnr = assert(args.buf)

          if client:supports_method("textDocument/documentSymbol") then
            require("nvim-navbuddy").attach(client, bufnr)
          end

          local nmap = function(keys, func, desc)
            if desc then
              desc = "LSP: " .. desc
            end

            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
          end

          nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          nmap("<C-c>", vim.lsp.buf.code_action, "[C]ode [A]ction")

          nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
          nmap("<leader>gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
          nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
          nmap(
            "<leader>ds",
            require("telescope.builtin").lsp_document_symbols,
            "[D]ocument [S]ymbols"
          )

          -- See `:help K` for why this keymap
          nmap("K", function()
            vim.lsp.buf.hover({ border = "single" })
          end, "Hover Documentation")
          vim.keymap.set(
            { "n", "i" },
            "<C-k>",
            vim.lsp.buf.signature_help,
            { buffer = bufnr, desc = "Signature Help" }
          )

          -- Lesser used LSP functionality
          nmap("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        end,
      })

      vim.diagnostic.config(opts.diagnostics)

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Ensure the servers above are installed
      local mason_lspconfig = require("mason-lspconfig")

      -- mason_lspconfig automatically sets up servers using nvim 0.11+ built-in vim.lsp.config()
      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers),
        automatic_enable = true,
        -- on_attach = on_attach,
      })

      -- Moved out of mason_lspconfig handlers loop because diagnostics
      -- were not being disabled.
      vim.lsp.config("jedi_language_server", {
        capabilities = capabilities,
        -- on_attach = on_attach,
        init_options = {
          diagnostics = { enable = false },
        },
      })

      -- Workaround for warning when using clang-format with clangd lsp.
      capabilities.offsetEncoding = { "utf-16" }

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        -- on_attach = on_attach,
        init_options = {
          diagnostics = { enable = false },
        },
      })
    end,
  },

  {
    -- From LazyVim's lua/lazyvim/plugins/lsp/init.lua
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = { -- For non-lsp tools.
        beautysh = {},
      },
    },
  },
}
