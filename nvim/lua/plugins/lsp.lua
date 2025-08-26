local vue_setup = function()
	-- Fetched from nvim-lspconfig/lsp/vtsls.lua GitHub. Enables TS support in vue files. The LSP
	-- also wasn't working without this.
	local vue_language_server_path = vim.fn.expand("$MASON/packages")
		.. "/vue-language-server"
		.. "/node_modules/@vue/language-server"

	local vue_plugin = {
		name = "@vue/typescript-plugin",
		location = vue_language_server_path,
		languages = { "vue" },
		configNamespace = "typescript",
	}

	vim.lsp.config("vtsls", {
		settings = {
			vtsls = {
				tsserver = {
					globalPlugins = {
						vue_plugin,
					},
				},
			},
		},
		filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
	})
end

local clang_setup = function()
	vim.lsp.config("clangd", {
		cmd = {
			"clangd",
			"--fallback-style=llvm",
			"--clang-tidy",
			"--clang-tidy-checks=*",
		},
	})
end

local config = function()
	require("mason").setup()

	require("mason-lspconfig").setup({
		ensure_installed = {
			"clangd",
			"basedpyright",
			"vtsls",
			"vue_ls",
			"lua_ls",
		},
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			"ruff",
			"prettierd",
			"stylua",
			"beautysh",
			"eslint_d",
		},
	})

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic information" })
	vim.diagnostic.config({
		underline = false,
	})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		end,
	})

	vue_setup()
	clang_setup()
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"neovim/nvim-lspconfig",
	},
	config = config,
}
