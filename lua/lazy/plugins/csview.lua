-- Highlights csv files and provides features for editing
-- https://github.com/hat0uma/csvview.nvim

-- Do not wrap CSV files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "csv",
	callback = function()
		vim.opt_local.wrap = false
	end,
})

return {
	"hat0uma/csvview.nvim",
	---@module "csvview"
	---@type CsvView.Options
	opts = {
		parser = { comments = { "#", "//" } },
		keymaps = {
			-- Text objects for selecting fields
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			-- Excel-like navigation:
			-- Use <Tab> and <S-Tab> to move horizontally between fields.
			-- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
			-- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
			jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
		view = {
			header_lnum = 1,
			min_column_width = 5,
			display_mode = "border",
			sticky_header = {
				enabled = true,
			},
		},
	},
	cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },

	-- color codes csv columns
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = "csv",
	},
}
