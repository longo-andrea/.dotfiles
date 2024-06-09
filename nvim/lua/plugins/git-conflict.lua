return {
  "akinsho/git-conflict.nvim",
  lazy = false,
  version = "*",
  config = function()
    vim.keymap.set("n", "<leader>sc", "<Cmd>GitConflictListQf<CR>")

    require("git-conflict").setup()
  end,
}
