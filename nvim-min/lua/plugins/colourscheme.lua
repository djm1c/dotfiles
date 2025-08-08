local config = function()
	require("gruvbox").setup({
		transparent_mode = true,
	})
end

return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
