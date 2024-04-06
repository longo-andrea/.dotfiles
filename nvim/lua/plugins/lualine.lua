return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    options = {
      theme = "kanagawa",
      globalstatus = true,
      section_separators = { left = "", right = "" },
      component_separators = "",
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
      lualine_b = {
        { "branch", icon = "" },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
      },
      lualine_c = { "%=", { "filetype", icon_only = true }, { "filename", path = 4 } },
      lualine_x = {},
      lualine_y = {
        {
          "diagnostics",
          symbolts = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
      },
      lualine_z = { "location" },
    },
  },
}
