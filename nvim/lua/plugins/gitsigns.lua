return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, key, command, description)
        vim.keymap.set(mode, key, command, { buffer = buffer })
      end

      map("n", "<leader>tb", function()
        gitsigns.toggle_current_line_blame()
      end)
      map("n", "<leader>gb", function()
        gitsigns.blame_line({ full = true })
      end)
    end,
  },
}
