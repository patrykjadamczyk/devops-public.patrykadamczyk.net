return {
    {
        'chomosuke/typst-preview.nvim',
        priority = vim.g.patconfig_highest_base_priority - 400,
        ft = 'typst',
        version = '1.*',
        build = function()
            require('typst-preview').update()
        end,
    }
}
