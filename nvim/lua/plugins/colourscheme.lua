local config = function()
	local GREEN = "#92B868"
	local YELLOW = "#ECDD5E"
	local BRONZE = "#BD985F"

	local lackluster = require("lackluster")

	lackluster.setup({
		tweak_syntax = {
			string = GREEN,
			string_escape = "default",
			comment = BRONZE,
			builtin = "default", -- builtin modules and functions
			type = "default",
			keyword = YELLOW,
			keyword_return = YELLOW,
			keyword_exception = YELLOW,
		},
		tweak_background = {
			normal = "none", -- use terminal background
			telescope = "none",
			menu = lackluster.color.gray3, -- nvim_cmp, wildmenu ... (bad idea to transparent)
			popup = lackluster.color.gray3, -- lazy, mason, whichkey ... (bad idea to transparent)
		},
	})
end

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
