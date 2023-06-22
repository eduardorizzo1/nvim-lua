local status, Comment = pcall(require, "Comment")

if not status then
	return
end

Comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "<leader>cc",
		block = "<leader>ca",
	},
	opleader = {
		line = "<leader>cc",
		block = "<leader>ca",
	},
	mappings = {
		basic = true,
		extra = true,
		extended = false,
	},
	pre_hook = nil,
	post_hook = nil,
})
