return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        enabled = true,
        auto_refresh = false,
        keymap = {
          jump_prev = "<C-p>",
          jump_next = "<C-n>",
          accept = "<CR>",
          refresh = "<leader>rr",
          open = "<M-CR>",
        },
        layout = {
          position = "left",
          ratio = 0.4,
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-Right>",
          accept_line = false,
          next = "<M-n>",
          prev = "<M-p>",
          dismiss = "<C-x>",
        },
      },
      filetypes = {
        javascript = true,
        typescript = true,
        vue = true,
        markdown = true,
      },
      copilot_node_command = "node",
      server_opts_overrides = {},
    })
  end,
}
