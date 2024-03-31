local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- C-c ESC
map({ "n", "i", "v", "x" }, "<C-c>", "<ESC>", opts)

-- Window Navigate
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)

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

map("n", "<S-up>", "<cmd>resize -5<cr>", opts)
map("n", "<S-down>", "<cmd>resize +5<cr>", opts)
map("n", "<S-left>", "<cmd>vertical resize -5<cr>", opts)
map("n", "<S-right>", "<cmd>vertical resize +5<cr>", opts)

-- Up and Down lines
map({ "n", "x" }, "J", "5j", opts)
map({ "n", "x" }, "K", "5k", opts)
map({ "n", "x" }, "<C-j>", "10j", opts)
map({ "n", "x" }, "<C-k>", "10k", opts)

-- Move Lines
map("n", "<C-A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<C-A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<C-A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<C-A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<C-A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<C-A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ctrl+z
map("n", "<C-z>", "<cmd>u<cr>", opts)
map("i", "<C-z>", "<Esc><cmd>u<cr>a", opts)
map("v", "<C-z>", "<Esc><cmd>u<cr>v", opts)
map("c", "<C-z>", "<Esc><cmd>u<cr>c", opts)
map("x", "<C-z>", "<Esc><cmd>u<cr>", opts)

map("v", "D", '"_d', opts) -- Delete without copy
map("n", "<C-q>", "<cmd>q<cr>", opts) -- ctrl+q to quit
map("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save all files" }) -- save all files
map("n", "<leader>*", "<cmd>noh<cr>", { desc = "Toggle highlight match" }) -- Toggle highlight match word
map("n", "<leader>uL", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative number" }) -- Toggle Relative number

--:NOTE:=================================================
--================[ P L U G I N S ]======================
--=======================================================
if not vim.g.vscode then
	map("n", "<leader>uI", "<cmd>IBLToggle<cr>", opts) -- IndentLine
	map("n", "<C-M-n>", "<cmd>RunCode<cr>", opts) -- Code Runner
	map("n", "<leader>u.", '<cmd>lua require("barbecue.ui").toggle()<cr>', opts) -- Barbecue
	map("n", "gR", '<cmd>lua require("rest-nvim").run()<cr>', opts) -- Rest
	map("n", "gn", "<leader>cr", { remap = true, silent = true, desc = "Lsp rename" }) -- IncRename
	map("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Comment line" })
	map("x", "<C-/>", "gc", { remap = true, silent = true, desc = "Comment selection" })
	map("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Comment line" })
	map("x", "<C-_>", "gc", { remap = true, silent = true, desc = "Comment selection" })
	map("n", "<leader>cc", "gcc", { remap = true, silent = true, desc = "Comment line" })
	map("v", "<leader>cc", "gc", { remap = true, silent = true, desc = "Comment line" })
	map("x", "<leader>cc", "gc", { remap = true, silent = true, desc = "Comment line" })

	-- Nvimtree
	map("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", opts)
	map("n", "_", "<cmd>NvimTreeResize -5<cr>", opts)
	map("n", "+", "<cmd>NvimTreeResize +5<cr>", opts)

	-- Bufferline
	map("n", "<M-l>", "<CMD>BufferLineCycleNext<cr>", opts)
	map("n", "<M-h>", "<CMD>BufferLineCyclePrev<cr>", opts)
	map("n", "<leader><tab>t", "<cmd>tabnew<cr>", { desc = "New Tab" })
	map("n", "<leader><tab><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
	map("n", "<leader><tab>n", "<cmd>tabnext<cr>", { desc = "Next Tab" })
	map("n", "<leader><tab><S-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
	map("n", "<leader><tab>p", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
	map("n", "<leader><tab>x", "<cmd>tabclose<cr>", { desc = "Close Tab" })

	-- Telescope
	map(
		"n",
		"<c-p>",
		'<cmd>lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<cr>',
		opts
	)
	map("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
	map("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
	map("n", "<leader>fa", '<cmd>lua require("telescope.builtin").grep_string()<cr>', opts)
	map(
		"n",
		"<leader>fm",
		'<cmd>lua require("telescope").extensions.media_files.media_files()<cr>',
		{ desc = "Media files" }
	)
	map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)

	-- Git
	map("n", "<leader>gb", '<cmd>lua require("telescope.builtin").git_branches()<cr>', opts)
	map("n", "<leader>gc", '<cmd>lua require("telescope.builtin").git_commits()<cr>', opts)
	map("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_stash()<cr>', opts)
	map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", opts) -- DiffView
	map("n", "<leader>ge", "<cmd>DiffviewToggleFiles<cr>", opts)
	map("n", "<leader>gh", "<cmd>DiffviewFileHistory<cr>", opts)
	map("n", "<leader>gD", "<cmd>Neogit<cr>", opts) -- NeoGit
	map("n", "<leader>ugb", "<cmd>BlamerToggle <cr>", opts)
	map("n", "<leader>ugs", "<cmd>Gitsigns toggle_signs <cr>", opts)

	-- Lsp Saga
	map("n", "gi", "<cmd>Lspsaga incoming_calls<cr>", opts)
	map("n", "go", "<cmd>Lspsaga outgoing_calls<cr>", opts)
	map("n", "gc", "<cmd>Lspsaga code_action<cr>", opts)
	map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	map("n", "gD", "<cmd>Lspsaga peek_type_definition<cr>", opts)
	map("n", "gt", "<cmd>Lspsaga goto_type_definition<cr>", opts)
	map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
	map("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	map("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	map("n", "ge", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
	map("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
	map("n", "<leader>uD", "<cmd>lua toggle_virtual_text()<cr>", opts)

	-- ToggleTerm
	map("n", "<C-t>", '<cmd>ToggleTerm direction="float"<cr>', opts)
	map("t", "<C-t>", "<cmd>close<cr>", { desc = "Hide Terminal" })
	map("n", "<C-\\>", '<cmd>ToggleTerm direction="horizontal"<cr>', opts)
	map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
	map("t", "<M-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
	map("t", "<M-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })

	-- Hop
	map("n", "<leader><leader>w", "<cmd>HopWordAC<cr>", opts)
	map("n", "<leader><leader>b", "<cmd>HopWordBC<cr>", opts)
	map("n", "<leader><leader>j", "<cmd>HopLineAC<cr>", opts)
	map("n", "<leader><leader>k", "<cmd>HopLineBC<cr>", opts)

	-- Debugger (Nvim-Dap)
	map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
	map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
	map("n", "<F8>", "<cmd>lua require'dap'.step_into()<cr>", opts)
	map("n", "<F7>", "<cmd>lua require'dap'.repl.open()<cr>", opts)

	-- ChatGPT
	map("n", "<leader>ao", "<cmd>ChatGPT<cr>", opts)
	map("v", "<leader>ai", "<cmd>ChatGPTEditWithInstructions<cr>", opts)
	map("v", "<leader>ar", "<cmd>ChatGPTRun<cr>", opts)
	map("v", "<leader>ac", "<cmd>ChatGPTCompleteCode<cr>", opts)
	map("v", "<leader>aO", "<cmd>ChatGPTActAs<cr>", opts)
end
