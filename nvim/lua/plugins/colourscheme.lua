return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = "warm",
			colors = {
				fg = "#fdf5d0",
				bg0 = "#202020",
				bg_d = "#202020",
			},
		})
		-- Enable theme
		require("onedark").load()
	end,
}
