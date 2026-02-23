require("config.lazy")
vim.o.clipboard = "unnamedplus"

require("plugins.lsp_override")

-- Insert-mode navigation using Ctrl + h/j/k/l
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- Set CopilotChat keymaps after plugins are loaded
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    -- Normal mode
    vim.keymap.set("n", "<leader>co", "<cmd>CopilotChatToggle<CR>", { desc = "Copilot Chat", silent = true })

    -- Visual mode
    vim.keymap.set("v", "<leader>ce", "<cmd>CopilotChatExplain<CR>", { desc = "Explain selection", silent = true })
    vim.keymap.set("v", "<leader>cr", "<cmd>CopilotChatReview<CR>", { desc = "Review selection", silent = true })
    vim.keymap.set("v", "<leader>cf", "<cmd>CopilotChatFix<CR>", { desc = "Fix selection", silent = true })
    vim.keymap.set("v", "<leader>ct", "<cmd>CopilotChatTests<CR>", { desc = "Generate tests", silent = true })
  end,
})
