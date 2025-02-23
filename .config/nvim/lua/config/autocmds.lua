local function create_augroup(augroup_name)
  return vim.api.nvim_create_augroup(augroup_name, { clear = true })
end

-- Enable format on save through Conform.
--   See https://github.com/stevearc/conform.nvim?tab=readme-ov-file#setup
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- Highlight yanked text region
vim.api.nvim_create_autocmd("TextYankPost", {

    group = create_augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
