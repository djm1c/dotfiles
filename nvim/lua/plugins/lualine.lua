local config = function()
	require("lualine").setup({
		options = {
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode", "branch", "diff" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { { "filename", file_status = true, path = 1 }, "diagnostics", "location" },
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
