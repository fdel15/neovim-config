-- Highlights and searchs for comments in your code such as TODO, HACK, BUG
-- https://github.com/folke/todo-comments.nvim

return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
