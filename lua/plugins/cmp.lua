local cmp = require'cmp'
local lspkind = require('lspkind')
local luasnip = require('luasnip')

local source_mapping = {
  buffer = "◉ Buffer",
  nvim_lsp = "👐 LSP",
  nvim_lua = "🌙 Lua",
  cmp_tabnine = "💡 Tabnine",
  path = "🚧 Path",
  luasnip = "🌜 LuaSnip"
}

cmp.setup {
	sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lua' },
		{ name = 'omni' },
  },

   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },

   formatting = {
      format = function(entry, vim_item)
	  		local icons = {
	  		   Text = "",
	  		   Method = "",
	  		   Function = "",
	  		   Constructor = "",
	  		   Field = "ﰠ",
	  		   Variable = "",
	  		   Class = "ﴯ",
	  		   Interface = "",
	  		   Module = " ",
	  		   Property = "ﰠ",
	  		   Unit = "塞",
	  		   Value = "",
	  		   Enum = "",
	  		   Keyword = "",
	  		   Snippet = "",
	  		   Color = "",
	  		   File = "",
	  		   Reference = "",
	  		   Folder = "",
	  		   EnumMember = "",
	  		   Constant = "",
	  		   Struct = "פּ",
	  		   Event = "",
	  		   Operator = "",
	  		   TypeParameter = "",
	  		}

         vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)

         return vim_item
      end,
   },

   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      },
      ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
   },
}

require("luasnip/loaders/from_vscode").load()
