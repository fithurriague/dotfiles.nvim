local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- ARROWS
map("n", "j", "h", opts)
map("n", "k", "j", opts)
map("n", "i", "k", opts)
map("v", "j", "h", opts)
map("v", "k", "j", opts)
map("v", "i", "k", opts)

-- INSERT MODE
map("n", "o", "i", opts)

-- NEW LINE
map("n", "u", "o<Esc>", opts)
map("n", "U", "O<Esc>", opts)

-- UNDO / REDO
map("n", "m", "u", opts)
map("n", "M", "<c-r>", opts)

-- BETTER INDENTING
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- MOVE CODE BLOCKS
map("v", "<Up>", ":move-2<CR>gv=gv", opts)
map("v", "<Down>", ":move'>+<CR>gv=gv", opts)

-- NAVIGATE BETWEEN PANELS
-- ====================
map("n", "<c-i>", ":wincmd k<cr>", opts)
map("n", "<c-k>", ":wincmd j<cr>", opts)
map("n", "<c-j>", ":wincmd h<cr>", opts)
map("n", "<c-l>", ":wincmd l<cr>", opts)
