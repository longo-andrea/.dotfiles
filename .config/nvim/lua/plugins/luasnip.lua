return {
  "L3MON4D3/LuaSnip",

  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")

    -- Load snippets from vscode
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })

    -- Expand snippet list
    vim.keymap.set({ "i" }, "<C-K>", function()
      ls.expand()
    end, { silent = true })

    -- Move forward in snippet placeholders list.
    vim.keymap.set({ "i", "s" }, "<C-h>", function()
      require("luasnip").jump(-1)
    end)
    -- Move backwards in snippet placeholders list.
    vim.keymap.set({ "i", "s" }, "<C-l>", function()
      require("luasnip").jump(1)
    end)
  end,
}
