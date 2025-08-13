local config = function()
	require("gruvbox").setup({})
end

return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
