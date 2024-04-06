return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    icons = {
      buffer_index = true,
      buffer_number = false,
      button = "󰅙",

      modified = { button = "󰴒" },
      pinned = { button = "", filename = true },

      inactive = {
        separator = { left = "", right = "" },
      },
      separator = { left = "", right = "" },
      separator_at_end = false,
    },
  },
  config = function(_, options)
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Move to previous/next
    map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
    map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
    -- Re-order to previous/next
    map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
    map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
    -- Goto buffer in position...
    map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
    map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
    map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
    map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
    map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
    map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
    map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
    map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
    map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
    map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
    -- Pin/unpin buffer
    map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
    -- Close buffer
    map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
    -- Wipeout buffer
    --                 :BufferWipeout
    -- Close commands
    map("n", "<leader>cabt", "<Cmd>BufferCloseAllButCurrent<CR>", opts)
    map("n", "<leader>cabp", "<Cmd>BufferCloseAllButPinned<CR>", opts)
    map("n", "<leader>cbl", "<Cmd>BufferCloseBuffersLeft<CR>", opts)
    map("n", "<leader>cbr", "<Cmd>BufferCloseBuffersRight<CR>", opts)

    -- Magic buffer-picking mode
    map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
    -- Sort automatically by...
    map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
    map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
    map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
    map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

    require("barbar").setup(options)
  end,
}
