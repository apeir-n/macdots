vim.filetype.add({
    extension = {
        crinkle = 'lua',
        genexpr = 'genexpr',
        applescript = 'applescript',
        scpt = 'applescript',
        maxstx = 'json',
        maxtheme = 'json',
        tal = 'uxntal',
    },
})

vim.treesitter.language.register('genexpr', 'genexpr')
require('nvim-treesitter.parsers').get_parser_configs().genexpr = {}
