return {
	"mg979/vim-visual-multi",
	init = function()
		local cmd = vim.cmd
		cmd([[ let g:VM_theme = 'neon' ]])
		cmd([[ let g:VM_maps = {} ]])
		cmd([[ let g:VM_default_mappings = 0 ]])
		cmd([[ let g:VM_mouse_mappings = 1 ]])
		cmd([[ let g:VM_maps["Find Under"] = "<C-n>" ]])
		cmd([[ let g:VM_maps["Find Subword Under"] = "<C-n>" ]])
		cmd([[ let g:VM_maps["Undo"] = "<C-z>" ]])
		cmd([[ let g:VM_maps["Redo"] = "<C-r>" ]])
		cmd([[ let g:VM_maps["Select Cursor Down"] = "<M-C-Down>" ]])
		cmd([[ let g:VM_maps["Select Cursor Up"] = "<M-C-Up>" ]])
		cmd([[ let g:VM_maps["Select All"] = "<M-n>" ]])
		cmd([[ let g:VM_maps["Skip Region"] = "<C-x>" ]])
	end,
}

-- cmd([[ let g:VM_maps["Select Operator"] = "gs" ]])
-- cmd([[ let g:VM_maps["Select Operator"] = "" ]])
-- cmd([[ let g:VM_maps["Visual All"] = "<M-n>" ]])
-- cmd([[ let g:VM_maps["Increase"] = "+" ]])
-- cmd([[ let g:VM_maps["Decrease"] = "-" ]])
--
--let s:Themes._light = ['sand', 'paper', 'lightblue1', 'lightblue2', 'lightpurple1', 'lightpurple2']
-- let s:Themes._dark = ['iceblue', 'ocean', 'neon', 'purplegray', 'nord', 'codedark', 'spacegray', 'olive', 'sand']
