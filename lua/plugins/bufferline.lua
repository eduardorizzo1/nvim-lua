local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup{
  options = {
  	view = "multiwindow",
   	separator_style = { "", "" },
   	show_buffer_close_icons = true,
   	buffer_close_icon = "",
   	modified_icon = "",
   	show_close_icon = true,
   	close_icon = "",
   	left_trunc_marker = "",
   	right_trunc_marker = "",
   	max_name_length = 14,
   	max_prefix_length = 15,
   	tab_size = 20,
   	enforce_regular_tabs = false,
   	always_show_bufferline = true,
   	show_tab_indicators = false,
   	diagnostic = 'nvim_lsp',
	 	--right_mouse_command = "vertical sbuffer %d",
		numbers = "none",
   	 
	 	diagnostics_indicator = function(count, level, diagnostics_dict)
   	  return "("..count..")"
   	end,
   	 
	 	offsets = {
   	  { 
	 			filetype = "NvimTree", 
	 	 		--text = '◀️ 🔍 💀 🧛 👻 🥷 👀 🔎 ▶️',
	 	 		-- text = 'File Explorer',
	 	 		--text = function()
	 	 		--	return vim.fn.getcwd()
	 	 		--end,
	 	 		-- text_align = "center",
	 	 		highlight = "Directory",
	 	 		padding = 0
   	   }
   	 },
   	 
	 	custom_filter = function(buf_number)
   	    -- Func to filter out our managed/persistent split terms
   	    local present_type, type = pcall(function()
   	       return vim.api.nvim_buf_get_var(buf_number, "term_type")
   	    end)

   	    if present_type then
   	       if type == "vert" then
   	          return false
   	       elseif type == "hori" then
   	          return false
   	       end
   	       return true
   	    end

   	    return true
   	 end,
  },


	highlights = {
		 --background = {
		 --	guifg = "#44475A",
		 --	guibg = "#191A21",
		 --},
		
		--fill = {
		--	guifg = "#191A21",
		--	guibg = "#191A21",
		--},

		buffer_selected = {
			guifg = "#8BE9FD",
			guibg = "#000000",
			gui = "bold",
		},

		--close_button = {
		--	guibg = "#191a21"
		--},
		
		close_button_selected = {
			guifg = "#8BE9FD",
			guibg = "#000000",
		},
		
		separator_selected = {
    	guifg = "#0000ff",
      guibg = "#0000ff",
    },

		indicator_selected = {
    	guifg = "#000000",
      guibg = "#000000",
    },
		
		modified_selected = {
    	guifg = "#F1FA8C",
      guibg = "#191A21",
    },

		--separator = {
		--	guifg = "#0000ff",
		--	guibg = "#0000ff",
		--},

		--separator_visible = {
		--	guifg = "#ABB2BF",
		--	guibg = "#ABB2BF",
		--},

		tab = {
			guifg = "#191A21",
			guibg = "#191A21",
		},

		tab_selected = {
			guifg = "#191A21",
			guibg = "#191A21",
		},

		tab_close = {
		--	guifg = "#191A21",
			guibg = "#000000",
		},

		modified = {
			guifg = "#F1FA8C",
			guibg = "#191A21",
    },

	}

}
