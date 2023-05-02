-- vim.cmd([[ hi DiagnosticUnnecessary guifg=NONE guibg=NONE cterm=undercurl gui=undercurl ]])
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
