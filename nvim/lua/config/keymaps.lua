-- Custom keymaps

-- Reproduce Cmd/Opt+Arrow(h/l) navigation
vim.api.nvim_set_keymap("n", "<D-Left>", "0", { desc = "Go to the beginnig of line" })
vim.api.nvim_set_keymap("n", "<D-h>", "0", { desc = "Go to the beginnig of line" })
vim.api.nvim_set_keymap("n", "<D-Right>", "$", { desc = "Go to the end of line" })
vim.api.nvim_set_keymap("n", "<D-l>", "$", { desc = "Go to the end of line" })
vim.api.nvim_set_keymap("v", "<D-Left>", "0", { desc = "Go to the beginnig of line" })
vim.api.nvim_set_keymap("v", "<D-h>", "0", { desc = "Go to the beginnig of line" })
vim.api.nvim_set_keymap("v", "<D-Right>", "$", { desc = "Go to the end of line" })
vim.api.nvim_set_keymap("v", "<D-l>", "$", { desc = "Go to the end of line" })

vim.api.nvim_set_keymap("n", "<A-Left>", "b", { desc = "Navigate backward one word" })
vim.api.nvim_set_keymap("n", "<A-h>", "b", { desc = "Navigate backward one word" })
vim.api.nvim_set_keymap("n", "<A-Right>", "w", { desc = "Navigate forward one word" })
vim.api.nvim_set_keymap("n", "<A-l>", "w", { desc = "Navigate forward one word" })
vim.api.nvim_set_keymap("v", "<A-Left>", "b", { desc = "Navigate backward one word" })
vim.api.nvim_set_keymap("v", "<A-h>", "b", { desc = "Navigate backward one word" })
vim.api.nvim_set_keymap("v", "<A-Right>", "w", { desc = "Navigate forward one word" })
vim.api.nvim_set_keymap("v", "<A-l>", "w", { desc = "Navigate forward one word" })

-- Reproduce Cmd/Opt+Backspace deletion
vim.api.nvim_set_keymap("n", "<D-Bs>", "d0", { desc = "Delete backward until the beginnig of the line" })
vim.api.nvim_set_keymap("n", "<A-Bs>", "db", { desc = "Delete previous word" })

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

local function resize_window(direction)
  local resize_horizontal = direction == "left" or direction == "right"
  local amount = resize_horizontal and 5 or 3

  local current_window_position = vim.api.nvim_win_get_position(0)
  local current_window_width = vim.api.nvim_win_get_width(0)
  local current_window_height = vim.api.nvim_win_get_height(0)

  if resize_horizontal then
    amount = current_window_position[2] == 0 and -amount or amount
  else
    amount = current_window_position[1] == 0 and -amount or amount
  end

  current_window_width = (direction == "left") and (current_window_width + amount) or (current_window_width - amount)
  current_window_height = (direction == "up") and (current_window_height + amount) or (current_window_height - amount)

  if resize_horizontal then
    vim.api.nvim_win_set_width(0, current_window_width)
  else
    vim.api.nvim_win_set_height(0, current_window_height)
  end
end

local function map(mode, key, command, options)
  options = options or {}

  options.silent = options.silent ~= false
  options.noremap = options.noremap ~= true

  vim.keymap.set(mode, key, command, options)
end

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable command-line window
map("n", "q:", "<nop>")

-- Window navigation
map("n", "<leader>w", "<cmd>only<CR>", { desc = "Close all windows except for current one" })
map("n", "<C-h>", try_window_jump_with_wrap("h", "l"), { desc = "Jump to window (left)" })
map("n", "<C-j>", try_window_jump_with_wrap("j", "k"), { desc = "Jump to window (down)" })
map("n", "<C-k>", try_window_jump_with_wrap("k", "j"), { desc = "Jump to window (up)" })
map("n", "<C-l>", try_window_jump_with_wrap("l", "h"), { desc = "Jump to window (right)" })

-- Copy selected text to system clipboard
map("v", "<leader>y", '"+y', { desc = "Copy to system clipboard" })
-- Replace selected text without yanking
map("v", "<leader>p", '"_dP', { desc = "Replace without yanking" })
-- Delete selected text without yanking
map("v", "<leader>d", '"-d"', { desc = "Delete without yanking" })
