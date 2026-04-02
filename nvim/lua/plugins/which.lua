local wk = require('which-key')

wk.setup({
    preset = 'helix',
    win = {
        title = false,
        title_pos = 'center',
    },
    icons = {
        separator = ' ',
        breadcrumb = '▸',
    },
})

wk.add({
    { '<leader>c', desc = ' theme', icon = '' },
    { '<leader>y', desc = ' yazi', icon = '󰀶' },
    { '<leader>u', desc = ' openurl', icon = '' },
    { '<leader>r', desc = ' reload', icon = '' },
    { '<leader>w', desc = ' wrap', icon = '' },
    { '<leader>p', desc = ' plugup', icon = '' },
    { '<leader>t', desc = ' telescope', icon = '' },
    { '<leader>fh', desc = ' find_help', icon = '' },
    { '<leader>fc', desc = ' find_cmds', icon = '' },
    { '<leader>fr', desc = ' find_rgstr', icon = '' },
    { '<leader>fo', desc = ' find_rcnts', icon = '' },
    { '<leader>fm', desc = ' find_manpg', icon = '' },
    { '<leader>fn', desc = ' find_notif', icon = '󰎟' },
    { '<leader>,', desc = ' macro_rec', icon = '󰟠' },
    { '<leader>.', desc = ' macro_play', icon = '󰟟' },
    { '<leader>d', desc = ' daddybear', icon = '󱣻' },
    { '<leader>lr', desc = ' lsp_rename', icon = '󰎎' },
    { '<leader>la', desc = ' lsp_action', icon = '' },
    { '<leader>ld', desc = ' lsp_jumpdef', icon = '' },
    { '<leader>li', desc = ' lsp_implem', icon = '' },
    { '<leader>lh', desc = ' lsp_hover', icon = '󰋟' },
    { '<leader>ls', desc = ' lsp_signat', icon = '' },
    { '<leader>lf', desc = ' lsp_format', icon = '󰛖' },
    { '<leader>le', desc = ' lsp_float', icon = '󰉪' },
    { '<leader>lq', desc = ' lsp_loclist', icon = '' },
    { '<leader>l[', desc = ' lsp_diagnxt', icon = '󰮰' },
    { '<leader>l]', desc = ' lsp_dianprv', icon = '󰮲' },
    { '<leader>ln', desc = ' lsp_nope', icon = '' },
    { '<leader>nm', desc = ' minmap_togl', icon = '' },
    { '<leader>nr', desc = ' minmap_refr', icon = '' },
    { '<leader>nf', desc = ' minmap_focs', icon = '' },
    { '<leader>ar', desc = ' automa_rain', icon = '󱎓' },
    { '<leader>al', desc = ' automa_life', icon = '󱎓' },
})
