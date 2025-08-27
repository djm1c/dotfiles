local config = function()
	require("lualine").setup({
		options = {
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {},
			lualine_b = { "mode", "branch" },
			lualine_c = { "diff" },
			lualine_x = { { "filename", file_status = true, path = 1 } },
			lualine_y = { "diagnostics", "location" },
			lualine_z = {},
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
