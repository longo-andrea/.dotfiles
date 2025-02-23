local function create_augroup(augroup_name)
  return vim.api.nvim_create_augroup(augroup_name, { clear = true })
end

-- Highlight yanked text region
vim.api.nvim_create_autocmd("TextYankPost", {
  group = create_augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
