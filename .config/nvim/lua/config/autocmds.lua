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

-- Setup LSP keymaps.
--  See `:help vim.lsp.buf.*`
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Format current buffer on save",
  group = vim.api.nvim_create_augroup("lsp-keymaps", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    local map = function(mode, lhs, rhs, opts)
      opts = opts or {}
      opts.buffer = args.buf

      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Default LSP capabilities' keymaps.
    map("n", "gd", vim.lsp.buf.definition)
    map("n", "gr", vim.lsp.buf.references)
    map("n", "K", function()
      vim.lsp.buf.hover({ border = "single" })
    end)
    map("n", "<leader>rn", vim.lsp.buf.rename)
    map("n", "<leader>ca", vim.lsp.buf.code_action)
  end,
})
