local config = function()
	require("lualine").setup({
		options = {
			globalstatus = true,
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", file_status = true, path = 1 }, "filetype" },
			lualine_x = {  },
			lualine_y = { },
			lualine_z = { "progress", "location" },
		},
		tabline = {},
	})
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = config,
}
