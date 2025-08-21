return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = "warm",
			transparent = true,
			colors = {
				fg = "#fdf5d0",
				grey = "#a5a5a5",
			},
		})
		-- Enable theme
		require("onedark").load()
	end,
}
