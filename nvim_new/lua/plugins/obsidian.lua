require('obsidian').setup {
    workspaces = {
        {
            name = 'Vault',
            path = '~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vault',
        }
    },
    daily_notes = { folder = '__planner' },
    templates = { folder = 'templates' },
    picker = { name = 'telescope.nvim' },
    open_notes_in = 'current',
    new_notes_location = 'current_dir',
    link = { style = 'wiki' },
    frontmatter = { enabled = false },
    ui = { enable = false },
    footer = { enabled = false },
    statusline = { enabled = false },
    legacy_commands = false,
    checkbox = {
        order = {
            ' ',
            'x',
            '>',
            '<',
            '-',
            '!',
            '?',
            '/',
            'I',
            'f',
            '"',
            'p',
            'c',
        },
    },
}
