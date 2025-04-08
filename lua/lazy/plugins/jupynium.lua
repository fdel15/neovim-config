-- Allows writing jupityer notebooks using nvim and displays them in browser using selenium
-- https://github.com/kiyoon/jupynium.nvim

return {
	{
		"kiyoon/jupynium.nvim",
		dependencies = {
			"rcarriga/nvim-notify", -- optional
			"stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
		},
		build = "pip3 install .",
		config = function()
			require("jupynium").setup({
				auto_start_server = {
					enable = true,
					file_pattern = { "*.ju.*" },
				},
				auto_start_sync = {
					enable = false,
					file_pattern = { "*.ju.*", "*.md" },
				},
				use_default_keybindings = false,
				shortsighted = true,
				textobjects = { use_default_keybindings = false },
			})
			vim.keymap.set("n", "<leader>js", "<cmd>JupyniumStartSync<CR>", { desc = "JupyniumStartSync" })
			vim.keymap.set("n", "<leader>jc", "<cmd>JupyniumStopSync<CR>", { desc = "JupyniumStopSync" })
			vim.keymap.set("n", "<leader>ja", "<cmd>JuyniumAttachServer<CR>", { desc = "JupyniumAttachServer" })
			vim.keymap.set(
				{ "n", "x" },
				"<leader>jx",
				"<cmd>JupyniumExecuteSelectedCells<CR>",
				{ desc = "Jupynium execute selected cells" }
			)
		end,
	},
}
