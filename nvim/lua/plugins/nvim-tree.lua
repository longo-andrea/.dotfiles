return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>tt", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>tf", "<cmd>NvimTreeFindFile<CR>", desc = "Toggle file explorer and focus current file" },
    { "<leader>to", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse current folder" },
  },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = "30%",
    },
    live_filter = {
      always_show_folders = false,
    },
  },
  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}
