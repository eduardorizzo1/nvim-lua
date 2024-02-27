local server = function()
	local msg = " Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return " " .. client.name
		end
	end
	return msg
end

return {
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
					},
				},
				lualine_y = {
					{
						server,
						separator = { left = "" },
						padding = { right = 1, left = 1 },
					},
				},
				lualine_z = {
					{ "location", separator = " ", padding = { left = 1, right = 0 } },
					{ "progress", padding = { left = 0, right = 1 } },
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, 3, {
				"searchcount",
			})
		end,
	},
}
