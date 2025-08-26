local config = function()
	local GREEN = "#92B868"
	local YELLOW = "#ECDD5E"
	local BRONZE = "#BD985F"

	local lackluster = require("lackluster")

	lackluster.setup({
		-- You can overwrite the following syntax colors by setting them to one of...
		--   1) a hexcode like "#a1b2c3" for a custom color.
		--   2) "default" or nil will just use whatever lackluster's default is.
		tweak_syntax = {
			string = GREEN,
			-- string = "#a1b2c3", -- custom hexcode
			-- string = color.green, -- lackluster color
			string_escape = "default",
			comment = BRONZE,
			builtin = "default", -- builtin modules and functions
			type = "default",
			keyword = YELLOW,
			keyword_return = YELLOW,
			keyword_exception = YELLOW,
		},
		-- You can overwrite the following background colors by setting them to one of...
		--   1) a hexcode like "#a1b2c3" for a custom color
		--   2) "none" for transparency
		--   3) "default" or nil will just use whatever lackluster's default is.
		tweak_background = {
			normal = "none", -- main background
			-- normal = 'none',    -- transparent
			-- normal = '#a1b2c3',    -- hexcode
			-- normal = color.green,    -- lackluster color
			telescope = "none", -- telescope
			menu = "default", -- nvim_cmp, wildmenu ... (bad idea to transparent)
			popup = "default", -- lazy, mason, whichkey ... (bad idea to transparent)
		},
	})
end

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	config = config,
}
