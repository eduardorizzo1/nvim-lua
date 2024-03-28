vim.api.nvim_create_augroup("discontinue_comments", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*" },
	callback = function()
		vim.opt.formatoptions = vim.opt.formatoptions - "o"
	end,
	group = "discontinue_comments",
	desc = "Dont't continue comments with o/O",
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		client.server_capabilities.semanticTokensProvider = nil
-- 	end,
-- })
