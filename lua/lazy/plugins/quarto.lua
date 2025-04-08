-- Quarto helps rendering markdown and so much more
-- https://github.com/quarto-dev/quarto-nvim
-- https://quarto.org/

return {
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
			"belubas/molten-nvim",
		},
		opts = {
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		},
		config = function()
			local runner = require("quarto.runner")
			vim.keymap.set("n", "<localleader>qc", runner.run_cell, { desc = "run cell", silent = true })
			vim.keymap.set("n", "<localleader>qa", runner.run_above, { desc = "run cell and above", silent = true })
			vim.keymap.set("n", "<localleader>qA", runner.run_all, { desc = "run all cells", silent = true })
			vim.keymap.set("n", "<localleader>qs", runner.run_line, { desc = "run line", silent = true })
			vim.keymap.set("v", "<localleader>qq", runner.run_range, { desc = "run visual range", silent = true })
			vim.keymap.set("n", "<localleader>qf", function()
				runner.run_all(true)
			end, { desc = "run all cells of all languages", silent = true })
		end,
	},
}
