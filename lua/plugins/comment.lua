require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = ';cc',
        block = ';ca',
    },

    opleader = {
        line = ';cc',
        block = ';ca'
    },

    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },

    pre_hook = nil,
    post_hook = nil,
})
