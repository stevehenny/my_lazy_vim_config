-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.clipboard = "unnamedplus"

-- manually require plugin overrides
require("plugins.lsp_override")
-- Insert-mode navigation using Ctrl + h/j/k/l
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = false, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = false, silent = true })
