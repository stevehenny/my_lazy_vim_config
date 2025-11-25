-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- ===============================
--  Horizontal / vertical terminal splits
-- ===============================

-- Floating terminal on <leader>m
vim.keymap.set("n", "<leader>h", function()
  -- Calculate size relative to current editor size
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Open floating terminal
  vim.api.nvim_open_win(
    vim.api.nvim_create_buf(false, true), -- create new scratch buffer
    true, -- enter the window
    {
      relative = "editor",
      width = width,
      height = height,
      row = row,
      col = col,
      style = "minimal",
      border = "rounded",
    }
  )
  vim.cmd("terminal")
end, { noremap = true, silent = true })
