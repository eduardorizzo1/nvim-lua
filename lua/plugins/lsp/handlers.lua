local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

local status_ok, illuminate = pcall(require, "illuminate")
if not status_ok then
	return
end

M.on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false

	if client.name == "tsserver" then
		local ts_utils = require("nvim-lsp-ts-utils")
		ts_utils.setup({})
		ts_utils.setup_client(client)
	end

	if client.name == "null-ls" then
		client.resolved_capabilities.document_formatting = true
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end

	illuminate.on_attach(client)
end

return M

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local lsp_formatting = function(client, bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             return client.name == "null-ls"
--         end,
--         bufnr = bufnr,
--     })
-- end

-- function M.enable_format_on_save()
--   vim.cmd [[
--     augroup format_on_save
--       autocmd!
--       autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
--     augroup end
--   ]]
--   vim.notify "Enabled format on save"
-- end
--
-- function M.disable_format_on_save()
--   M.remove_augroup "format_on_save"
--   vim.notify "Disabled format on save"
-- end
--
-- function M.toggle_format_on_save()
--   if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
--     M.enable_format_on_save()
--   else
--     M.disable_format_on_save()
--   end
-- end
--
-- function M.remove_augroup(name)
--   if vim.fn.exists("#" .. name) == 1 then
--     vim.cmd("au! " .. name)
--   end
-- end
--
-- vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("plugins.lsp.handlers").toggle_format_on_save()' ]]
