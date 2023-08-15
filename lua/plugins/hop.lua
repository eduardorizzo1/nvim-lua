return {
  "phaazon/hop.nvim",
  branch = "v1",
	jump_on_solo_occurrence = false,
  config = function ()
    require('hop').setup()
  end
}