local status, hop = pcall(require, "hop")

if not status then
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
	jump_on_solo_occurrence = false,
})
