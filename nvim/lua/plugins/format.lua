return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	opts = {
		notify_on_error = true,
		format_on_save = function()
			return {
				timeout_ms = 500,
				lsp_fallback = true,
			}
		end,
		formatters_by_ft = {
			sh = { "beautysh" },
			c = {},
			cpp = {},
			css = { "prettierd" },
			fish = { "fish_indent" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			vue = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = {},
			rust = {},
			sql = { "sql_formatter" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			yaml = { "prettierd" },
			zsh = { "beautysh" },
		},
	},

	vim.keymap.set({ "n", "v" }, "<leader>F", function()
		require("conform").format({ async = true, lsp_fallback = true })
	end, { desc = "Format file or visual-mode range." }),
}
