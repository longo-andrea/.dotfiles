return {
  "nvim-lualine/lualine.nvim",
  opts = {
    theme = "catppuccin",
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        { "branch", icons_enabled = false },
        { "diff" },
      },
      lualine_c = {
        "%=",
        { "filename", path = 4 },
      },
      lualine_x = {},
      lualine_y = {
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
      },
      lualine_z = {
        { "location" },
        { "filetype", icons_enabled = false },
      },
    },
  },
}
