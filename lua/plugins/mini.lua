return { 
  {
		'echasnovski/mini.surround',
 		version = '*',
 	 	opts = {
 	 	  custom_surroundings = nil,
		 	 highlight_duration = 500,
		 	 n_lines = 20,
		 	 search_method = "cover",
		 	 mappings = {
		 	 	add = "s", -- Add surrounding in Normal and Visual modes
		 	 	delete = "sd", -- Delete surrounding
		 	 	find = "sf", -- Find surrounding (to the right)
		 	 	find_left = "sF", -- Find surrounding (to the left)
		 	 	highlight = "sh", -- Highlight surrounding
		 	 	replace = "sr", -- Replace surrounding
		 	 	update_n_lines = "sn", -- Update `n_lines`
		 	 }
 	 	},
	},
}