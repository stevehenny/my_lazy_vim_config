return {
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-l>", -- accept suggestion
            next = "<C-]>", -- next suggestion
            prev = "<C-h>", -- previous suggestion
            dismiss = "<C-x>", -- dismiss suggestion
          },
        },
        panel = {
          enabled = true,
          auto_refresh = true,
        },
      })
    end,
  },
}
