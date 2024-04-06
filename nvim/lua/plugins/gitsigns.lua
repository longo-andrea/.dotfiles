return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(buffer)
      local gitsigns = package.loaded.gitsigns

      local function map(mode, key, command, description)
        vim.keymap.set(mode, key, command, { buffer = buffer, desc = description })
      end

      map("n", "<leader>tb", function()
        gitsigns.toggle_current_line_blame()
      end, { desc = "toggle line blame" })
      map("n", "<leader>gb", function()
        gitsigns.blame_line({ full = true })
      end, "Blame Line")
    end,
  },
}
