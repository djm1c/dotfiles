local config = function()
	local GREEN = "#92B868"
	local YELLOW = "#ECDD5E"
	local BRONZE = "#BD985F"

	local lackluster = require("lackluster")

	lackluster.setup({
		tweak_color = {
			gray4 = lackluster.color.gray7, -- gray4 is too washed out against diagnostic popup bg colour
			gray6 = lackluster.color.gray7, -- gray6 is too washed out against cmp popup bg colour
		},
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
			menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
			popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
		},
	})
end

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
