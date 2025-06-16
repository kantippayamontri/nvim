return {
    'willothy/moveline.nvim',
    build = 'make',
    config = function()
        local moveline = require('moveline')
        vim.keymap.set('n', '<alt-k>', moveline.up)
        vim.keymap.set('n', '<alt-j>', moveline.down)
        vim.keymap.set('v', '<alt-k>', moveline.block_up)
        vim.keymap.set('v', '<alt-j>', moveline.block_down)
    end,
}
