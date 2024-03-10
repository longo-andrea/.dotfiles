return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    {
      "<leader><Space>",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "Project Find file (cwd)",
    },
    {
      "<leader>gf",
      function()
        require("telescope.builtin").git_files({ show_untracked = true })
      end,
      desc = "Project Find file (gwd)",
    },
    {
      "<leader>lg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Project Grep string",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Grep String under cursor",
    },
  },
  opts = function()
    local file_ignore_patterns = { ".git/", "node_modules/*", "pnpm-lock", "yarn.lock" }
    local telescope_config = require("telescope.config")

    local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

    table.insert(vimgrep_arguments, "--hidden")
    table.insert(vimgrep_arguments, "--glob")
    table.insert(vimgrep_arguments, "!**/.git/*")

    return {
      defaults = {
        vimgrep_arguments = vimgrep_arguments,
        file_ignore_patterns = file_ignore_patterns,
        mappings = {
          i = {
            ["<C-i>"] = function(...)
              return require("telescope.actions.layout").toggle_preview(...)
            end,
          },
        },
        preview = {
          hide_on_startup = false,
        },
        borderchars = {
          { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      },
    }
  end,
}
