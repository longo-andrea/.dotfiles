return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  config = function()
    vim.keymap.set("n", "<leader>h", require("grapple").toggle)
    vim.keymap.set("n", "<leader>H", require("grapple").toggle_tags)
    vim.keymap.set("n", "<leader>rH", require("grapple").reset)
  end,
}
