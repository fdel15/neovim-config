-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Make line numbers default
vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 1000

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TERMINAL MODE

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<Esc>q", "<C-\\><C-n>:q!<CR>", { desc = "Exit terminal and quit" })
vim.keymap.set("n", "<leader>tt", ":terminal<CR>i", { desc = "Opens new terminal in new buffer" })
vim.keymap.set("n", "<leader>ts", ":split<CR>:terminal<CR>i", { desc = "Opens new terminal horizontal split" })
vim.keymap.set("n", "<leader>tv", ":vsplit<CR>:terminal<CR>i", { desc = "Opens new terminal vertical split" })

-- Keybinds to make split navigation easier
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Keybinds to resize windows
vim.keymap.set("n", "<leader>jj", ":resize +10 <CR>", { desc = "Resize height +10" })
vim.keymap.set("n", "<leader>jk", ":resize -10 <CR>", { desc = "Resize height -10" })
vim.keymap.set("n", "<leader>jh", ":vertical resize -20 <CR>", { desc = "Resize width -10" })
vim.keymap.set("n", "<leader>jl", ":vertical resize +20 <CR>", { desc = "Resize width +10" })

-- keybinds to move windows
vim.keymap.set("n", "<leader>mj", "<C-w>J", { desc = "Move current window to bottom" })
vim.keymap.set("n", "<leader>mk", "<C-w>K", { desc = "Move current window to top" })
vim.keymap.set("n", "<leader>mh", "<C-w>H", { desc = "Move current window to left" })
vim.keymap.set("n", "<leader>ml", "<C-w>L", { desc = "Move current window to right" })
vim.keymap.set("n", "<leader>kk", "<C-w>_", { desc = "Max current window height" })
vim.keymap.set("n", "<leader>kj", "<C-w>|", { desc = "Max current window width" })
