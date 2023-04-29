vim.cmd([[ hi DiagnosticUnnecessary guifg=NONE guibg=NONE cterm=undercurl gui=undercurl ]])
vim.cmd([[ filetype plugin indent on ]])
vim.cmd([[ syntax enable ]])

-- -- Lsp Semantic
local lsp_semantic_types = {
	"class",
	"enum",
	"decorator",
	"enumMember",
	"function",
	"interface",
	"macro",
	"method",
	"namespace",
	"parameter",
	"property",
	"struct",
	"type",
	"variable",
}

for _, type in ipairs(lsp_semantic_types) do
	vim.cmd(string.format([[ hi @lsp.type.%s guifg=none ]], type))
end

-- -- Lsp Semantic
-- vim.cmd([[ hi @lsp.type.class guifg=none ]])
-- vim.cmd([[ hi @lsp.type.enum guifg=none ]])
-- vim.cmd([[ hi @lsp.type.decorator guifg=none ]])
-- vim.cmd([[ hi @lsp.type.enumMember guifg=none ]])
-- vim.cmd([[ hi @lsp.type.function guifg=none ]])
-- vim.cmd([[ hi @lsp.type.interface guifg=none ]])
-- vim.cmd([[ hi @lsp.type.macro guifg=none ]])
-- vim.cmd([[ hi @lsp.type.method guifg=none ]])
-- vim.cmd([[ hi @lsp.type.namespace guifg=none ]])
-- vim.cmd([[ hi @lsp.type.parameter guifg=none ]])
-- vim.cmd([[ hi @lsp.type.property guifg=none ]])
-- vim.cmd([[ hi @lsp.type.struct guifg=none ]])
-- vim.cmd([[ hi @lsp.type.type guifg=none ]])
-- vim.cmd([[ hi @lsp.type.variable guifg=none ]])
