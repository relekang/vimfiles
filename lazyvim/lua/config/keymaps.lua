-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- save
vim.keymap.set("n", ";;", ":w<Cr>")
vim.keymap.set("n", "øø", ":w<Cr>")

-- vim-tmux-navigator
vim.keymap.set({ "i", "n", "v" }, "<C-k>", "<cmd>TmuxNavigateUp<cr><esc>", { desc = "Move cursor to top pane" })
vim.keymap.set({ "i", "n", "v" }, "<C-j>", "<cmd>TmuxNavigateDown<cr><esc>", { desc = "Move cursor to bottom pane" })
vim.keymap.set({ "i", "n", "v" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr><esc>", { desc = "Move cursor to left pane" })
vim.keymap.set({ "i", "n", "v" }, "<C-l>", "<cmd>TmuxNavigateRight<cr><esc>", { desc = "Move cursor to right pane" })
vim.keymap.set(
  { "i", "n", "v" },
  "<C-\\>",
  "<cmd>TmuxNavigatePrevious<cr><esc>",
  { desc = "Move cursor to previous pane" }
)

-- diagnostics
vim.keymap.set("n", "<leader>xp", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to previous diagnostic error" })
vim.keymap.set("n", "<leader>xn", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Go to next diagnostic error" })
vim.keymap.set("n", "<leader>xpp", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to previous diagnostic warn" })
vim.keymap.set("n", "<leader>xnn", function()
  vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Go to next diagnostic warn" })

vim.keymap.set("n", "<leader>p", "<leader>xp", { remap = true, desc = "Go to previous diagnostic error" })
vim.keymap.set("n", "<leader>n", "<leader>xn", { remap = true, desc = "Go to next diagnostic error" })

-- neo-tree
vim.keymap.set("n", "=", "<leader>fe", { remap = true })
vim.keymap.set("n", "+", "<leader>fe", { remap = true })
