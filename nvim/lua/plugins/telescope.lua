return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
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
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
      config = function()
        require("telescope").load_extension("live_grep_args")
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
      "<C-k>",
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      desc = "Project Grep string",
    },
    {
      "<leader>sb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Search open buffers",
    },
  },
  opts = function()
    local lga_actions = require("telescope-live-grep-args.actions")

    return {
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<A-k>"] = lga_actions.to_fuzzy_refine,
            },
          },
        },

        fzf = {
          fuzzy = true,
        },
      },

      defaults = {
        layout_config = {
          preview_width = 80,
          prompt_position = "top",
        },

        sorting_strategy = "ascending",

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
  config = function(_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)

    telescope.load_extension("fzf")
    telescope.load_extension("live_grep_args")
  end,
}
