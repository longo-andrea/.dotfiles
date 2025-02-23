return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      shortcut_type = "number",
      config = {
        header = {
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠀⢀⣀⠀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠜⠁⣷⢊⠤⡇⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⡠⠴⠨⠼⡜⡝⠀⠀⠀",
          "⠀⢀⣀⣀⣠⡤⠔⠒⠚⠉⢙⣖⡎⢰⣞⣶⠄⠘⢣⠀⠀⠀",
          "⢰⣿⣿⣿⣿⣿⠀⠀⠀⠀      ⠀⠀⠈⡆⠀⠀",
          "⢹⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀",
          "⢸⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⡀ ⡇⠀⠀",
          "⠀⠙⠿⣿⡿⠟⠀⠀⠀⠀⠀⠀⠀⣀⣠⠮⠀ ⢈⠃⠀⠀",
          "⠀⠀⠀⠀⠉⠒⠒⠒⡆⠀⠀    ⠀ ⢀⣼⡀⠀⠀",
          "⠀⠀⠀⠀⠀⠀⠀⢂⠏⠓⠶⠖⣒⣲⡲⠮⠝⠛⠁⠈⢆⠀",
          "⠀⠀⠀⠀⠀⠀⠀⡌⡆⠀⠀⠀⠀⠀⠀⠀⠀⠸⠁⠀⠈⡆",
          "⠀⠀⠀⠀⠀⠀⠀⢏⢇⠈⠀⠀⠀⠀⠀⠀⠀⣠⠓⠋⠀⣀",
          "⠀⠀⠀⠀⠀⠀⠀⠈⢺⠓⢶⢒⣶⣲⣶⡒⠶⠲⣄⣀⡸⠉",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠃⠻⣥⠥⠄⠀⠐⠔⢸⠇⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢣⢠⣄⠀⢻⡂⢀⠀⠀⠀⢸⡇⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⡀⠙⠀⠘⡋⣞⠄⠀⠀⢸⡇⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⣌⠉⠉⠉⠹⠉⠒⠒⠒⠊⣱⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⡔⠉⠉⠻⣫⢗⣣⡶⢶⣷⣶⠞⡏⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠱⣤⣤⣤⡽⡮⣏⠀⠀⠈⣛⢿⠇⠀",
          "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠒⠒⠒⠒⠁⠀⠀",
        },
        footer = { "🚀 Skyrocket Productivity 🚀" },
        packages = { enable = false },
        project = { enable = false },
        mru = { enable = true, limit = 9, label = "Recent opened files", cwd_only = true },
        shortcut = {
          {
            desc = "🎛 Open .env",
            group = "Number",
            action = "e .env",
            key = "e",
          },
          {
            desc = "📦 Open package.json",
            group = "Number",
            action = "e package.json",
            key = "p",
          },
          {
            desc = "🚪 Quit",
            group = "Number",
            action = "q!",
            key = "q",
          },
        },
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
