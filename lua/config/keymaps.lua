local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- C-c ESC
map({ "n", "i", "v", "x" }, "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<C-Up>", "<C-w>k", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Right>", "<C-w>l", opts)

map("n", "<C-S-k>", "<C-w>k", opts)
map("n", "<C-S-j>", "<C-w>j", opts)
map("n", "<C-S-h>", "<C-w>h", opts)
map("n", "<C-S-l>", "<C-w>l", opts)

-- Resize Window
map("n", "<C-M-k>", "<cmd>resize -5<cr>", opts)
map("n", "<C-M-j>", "<cmd>resize +5<cr>", opts)
map("n", "<C-M-h>", "<cmd>vertical resize -5<cr>", opts)
map("n", "<C-M-l>", "<cmd>vertical resize +5<cr>", opts)
map("n", "<S-->", "<cmd>vertical resize -5<cr>", opts)
map("n", "<S-=>", "<cmd>vertical resize +5<cr>", opts)
map("n", "<C-q>", "<cmd>q<cr>", opts) -- quit

-- Up and Down lines
map({ "n", "x" }, "J", "5j", opts)
map({ "n", "x" }, "K", "5k", opts)
map({ "n", "x" }, "<C-j>", "10j", opts)
map({ "n", "x" }, "<C-k>", "10k", opts)

-- ctrl+z
map("n", "<C-z>", "<cmd>u<cr>", opts)
map("i", "<C-z>", "<Esc><cmd>u<cr>a", opts)
map("v", "<C-z>", "<Esc><cmd>u<cr>v", opts)
map("c", "<C-z>", "<Esc><cmd>u<cr>c", opts)
map("x", "<C-z>", "<Esc><cmd>u<cr>", opts)

map("v", "D", '"_d', opts) -- Delete without copy
map("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save all files" }) -- save all files
map("n", "<leader>*", "<cmd>noh<cr>", { desc = "Toggle highlight match" }) -- Toggle highlight match word
map("n", "<leader>uL", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative number" }) -- Toggle Relative number

--NOTE:================[ P L U G I N S ]======================
map("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Comment line" })
map("x", "<C-/>", "gc", { remap = true, silent = true, desc = "Comment selection" })
map("n", "<leader>cc", "gcc", { remap = true, silent = true, desc = "Comment line" })
map({ "x", "v" }, "<leader>cc", "gc", { remap = true, silent = true, desc = "Comment line" })

-- ToggleTerm
map("n", "<C-t>", '<cmd>ToggleTerm direction="float"<cr>', opts)
map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("n", "<C-\\>", '<cmd>ToggleTerm direction="horizontal"<cr>', opts)
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Snacks Explorer

map("n", "<C-b>", "<cmd>lua Snacks.explorer()<cr>", { desc = "Toggle Explorer" })
