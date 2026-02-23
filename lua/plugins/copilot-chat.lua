return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,

      -- Use current buffer / selection as context
      context = "buffer",

      -- Chat window behavior
      window = {
        layout = "vertical", -- or "horizontal", "float"
        width = 0.4,
      },

      -- Reasonable system prompt
      system_prompt = "You are a senior software engineer helping with code reviews and refactors.",
    },

    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
    },
  },
}
