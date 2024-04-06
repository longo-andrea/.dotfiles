-- Utils to remap keys
local function map(mode, key, command, options)
  options = options or {}

  options.silent = options.silent ~= false
  options.noremap = options.noremap ~= true

  vim.keymap.set(mode, key, command, options)
end

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
local function try_window_jump(jump_direction, jump_count)
  local previous_window_number = vim.fn.winnr()
  vim.cmd(jump_count .. "wincmd " .. jump_direction)
  return vim.fn.winnr() ~= previous_window_number
end

local function try_window_jump_with_wrap(intended_jump_direction, opposite_direction)
  local jump_count = vim.v.count1
  return function()
    if not try_window_jump(intended_jump_direction, jump_count) then
      try_window_jump(opposite_direction, 999)
    end
  end
end
map("n", "<C-h>", try_window_jump_with_wrap("h", "l"), { desc = "Jump to window (left)" })
map("n", "<C-j>", try_window_jump_with_wrap("j", "k"), { desc = "Jump to window (down)" })
map("n", "<C-k>", try_window_jump_with_wrap("k", "j"), { desc = "Jump to window (up)" })
map("n", "<C-l>", try_window_jump_with_wrap("l", "h"), { desc = "Jump to window (right)" })

-- FILE NAVIGATION
-- CMD/Options mapping
map("n", "<A-h>", "b", { desc = "Previous word" })
map("n", "<A-Left>", "b", { desc = "Previous word" })
map("v", "<A-h>", "b", { desc = "Previous word" })
map("v", "<A-Left>", "b", { desc = "Previous word" })

map("n", "<A-l>", "w", { desc = "Next word" })
map("n", "<A-Right>", "w", { desc = "Next word" })
map("v", "<A-l>", "w", { desc = "Next word" })
map("v", "<A-Right>", "w", { desc = "Next word" })

map("n", "<D-Left>", "0", { desc = "Go to the beginning of line" })
map("n", "<D-Right>", "$", { desc = "Go to the end of line" })
map("v", "<D-Left>", "0", { desc = "Go to the beginning of line" })
map("v", "<D-Right>", "$", { desc = "Go to the end of line" })

-- FILE EDITING
-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Enhance clipboard
-- Copy to system clipboard
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
-- Paste without yanking
map("v", "<leader>p", '"_dP', { desc = "Replace without yanking" })
-- Delete without yanking
map("v", "<leader>d", '"-d"', { desc = "Delete without yanking" })

-- FILE STATE
-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Close all buffers and discard changes
map("n", "<leader>qq", "<cmd>qa!<cr>", { desc = "Quit All" })
-- Close all buffers and save changes
map("n", "<leader>qqs", "<cmd>wqa<cr>", { desc = "Save All" })
-- Close current buffer
map("n", "q", "<cmd>q!<CR>", { desc = "Quit file" })
-- Close current buffer and save changes
map("n", "<leader>qs", "<cmd>wq<cr>", { desc = "Save and Quit" })
