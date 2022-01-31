local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local lspkind = require('lspkind')
require("luasnip/loaders/from_vscode").load()



local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--   פּ ﯟ   蘒練 some other good icons
-- local icons = {
--   Text = "",
--   Method = "m",
--   Function = "",
--   Constructor = "",
--   Field = "",
--   Variable = "",
--   Class = "",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   Keyword = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   Constant = "",
--   Struct = "",
--   Event = "",
--   Operator = "",
--   TypeParameter = "",
-- }
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
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
	  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
    --  vim_item.kind = string.format("%s", icons[vim_item.kind])
			vim_item.kind = string.format("%s ", icons[vim_item.kind])

      if entry.source.name == "cmp_tabnine" then
        vim_item.kind = "💡"
      end

      -- NOTE: order matters
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim]",
        luasnip = "[Snippets]",
        buffer = "[Buffer]",
        path = "[Path]",
        emoji = "[Emoji]",
				cmp_tabnine = "[Tabnine]"
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "cmp_tabnine" },
    { name = "path" },
    { name = "emoji" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  documentation = false,
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}




-- local source_mapping = {
--   buffer = "◉ Buffer",
--   nvim_lsp = "👐 LSP",
--   nvim_lua = "🌙 Lua",
--   cmp_tabnine = "💡 Tabnine",
--   path = "🚧 Path",
--   luasnip = "🌜 LuaSnip"
-- }
--
-- cmp.setup {
-- 	sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--     { name = 'buffer' },
--     { name = 'path' },
--     { name = 'nvim_lua' },
-- 		{ name = 'omni' },
--   },
--
--    snippet = {
--       expand = function(args)
--          require("luasnip").lsp_expand(args.body)
--       end,
--    },
--
--    formatting = {
--       format = function(entry, vim_item)
-- 	  		local icons = {
-- 	  		   Text = "",
-- 	  		   Method = "",
-- 	  		   Function = "",
-- 	  		   Constructor = "",
-- 	  		   Field = "ﰠ",
-- 	  		   Variable = "",
-- 	  		   Class = "ﴯ",
-- 	  		   Interface = "",
-- 	  		   Module = " ",
-- 	  		   Property = "ﰠ",
-- 	  		   Unit = "塞",
-- 	  		   Value = "",
-- 	  		   Enum = "",
-- 	  		   Keyword = "",
-- 	  		   Snippet = "",
-- 	  		   Color = "",
-- 	  		   File = "",
-- 	  		   Reference = "",
-- 	  		   Folder = "",
-- 	  		   EnumMember = "",
-- 	  		   Constant = "",
-- 	  		   Struct = "פּ",
-- 	  		   Event = "",
-- 	  		   Operator = "",
-- 	  		   TypeParameter = "",
-- 	  		}
--
--          vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
--
--          return vim_item
--       end,
--    },
--
--    mapping = {
--       ["<C-p>"] = cmp.mapping.select_prev_item(),
--       ["<C-n>"] = cmp.mapping.select_next_item(),
--       ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--       ["<C-f>"] = cmp.mapping.scroll_docs(4),
--       ["<C-Space>"] = cmp.mapping.complete(),
--       ["<C-e>"] = cmp.mapping.close(),
--       ["<CR>"] = cmp.mapping.confirm {
--          behavior = cmp.ConfirmBehavior.Replace,
--          select = true,
--       },
--       ["<Tab>"] = function(fallback)
--          if cmp.visible() then
--             cmp.select_next_item()
--          elseif require("luasnip").expand_or_jumpable() then
--             vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--          else
--             fallback()
--          end
--       end,
--       ["<S-Tab>"] = function(fallback)
--          if cmp.visible() then
--             cmp.select_prev_item()
--          elseif require("luasnip").jumpable(-1) then
--             vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--          else
--             fallback()
--          end
--       end,
--    },
-- }
--
