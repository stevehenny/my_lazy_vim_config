return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- override the default LSP keymaps LazyVim sets
      keys = {
        -- disable the Insert-mode <C-k> → signature help mapping
        { "<C-k>", false, mode = "i" },
      },
    },
  },
}
