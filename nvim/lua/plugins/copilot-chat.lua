return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    lazy = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      { "<leader>co", "<cmd>:CopilotChatToggle<CR>", { desc = "Toggle copilot chat" } },
    },
    opts = {},
  },
}
