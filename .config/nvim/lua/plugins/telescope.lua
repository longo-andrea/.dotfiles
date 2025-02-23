return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  opts = {
    defaults = require("telescope.themes").get_ivy({
      layout_config = {
        preview_width = 80,
      },
      preview = {
        hide_on_startup = true,
      },
      borderchars = {
        preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
      mappings = {
        i = {
          ["<C-p>"] = function(...)
            return require("telescope.actions.layout").toggle_preview(...)
          end,
        },
      },
    }),
    extensions = {
      fzf = {},
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("fzf")

    -- Find files using current working directory as base directory.
    vim.keymap.set("n", "<leader><Space>", function()
      require("telescope.builtin").find_files({ hidden = true })
    end)

    -- Grep word currently under cursor.
    vim.keymap.set("n", "<leader>gc", require("telescope.builtin").grep_string)

    -- Grep word live.
    vim.keymap.set("n", "<leader>gs", require("telescope.builtin").live_grep)

    -- Show open buffers
    vim.keymap.set("n", "<leader>sb", require("telescope.builtin").buffers)
  end,
}
