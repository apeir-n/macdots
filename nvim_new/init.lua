vim.cmd('filetype plugin on')

----------------------------
--         colors         --
----------------------------
vim.pack.add({
   eck'https://github.com/sainnhe/edge'
    'https://github.com/sainnhe/sonokai'
    'https://github.com/sainnhe/everforest'
    'https://github.com/sainnhe/gruvbox-material'
    'https://github.com/rebelot/kanagawa.nvim'
    'https://github.com/webhooked/kanso.nvim'
})


----------------------------
--        plugins         --
----------------------------
vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter'
    'https://github.com/neovim/nvim-lspconfig'
    'https://github.com/mfussenegger/nvim-lint'
    'https://github.com/rcarriga/nvim-notify'
    'https://github.com/kylechui/nvim-surround'
    'https://github.com/windwp/nvim-autopairs'
    'https://github.com/norcalli/nvim-colorizer.lua'
    'https://github.com/nvim-tree/nvim-web-devicons'
    'https://github.com/folke/which-key.nvim'
    'https://github.com/goolord/alpha-nvim'
    'https://github.com/lewis6991/gitsigns.nvim'
    'https://github.com/numToStr/Comment.nvim'
    'https://github.com/zaldih/themery.nvim'
    'https://github.com/drgfunk/streamline.nvim'
    'https://github.com/folke/noice.nvim'
    'https://github.com/obsidian-nvim/obsidian.nvim'
    'https://github.com/MeanderingProgrammer/render-markdown.nvim'
    'https://github.com/nvim-telescope/telescope.nvim'
    'https://github.com/nanozuki/tabby.nvim'
    'https://github.com/mikavilpas/yazi.nvim'
    'https://github.com/folke/flash.nvim'
    'https://github.com/mrcjkb/rustaceanvim'
    'https://github.com/karb94/neoscroll.nvim'
    'https://github.com/eandrju/cellular-automaton.nvim'
    'https://github.com/Isrothy/neominimap.nvim'
    'https://github.com/tidalcycles/vim-tidal'
})

----------------------------
--          libs          --
----------------------------
vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim'
    'https://github.com/MunifTanjim/nui.nvim'
})

----------------------------
--          load          --
----------------------------
require('config.autocmd')
--require('config.filetypes')
require('config.lsp')
require('config.mappings')
require('config.options')
require('config.transparent')

require('plugins.alpha')
require('plugins.autopairs')
require('plugins.colorizer')
require('plugins.comment')
require('plugins.gitsigns')
require('plugins.noice')
require('plugins.notify')
require('plugins.lint')
require('plugins.obsidian')
require('plugins.markdown')
require('plugins.streamline')
require('plugins.tabby')
require('plugins.telescope')
require('plugins.themery')
require('plugins.treesitter')
require('plugins.which')
require('plugins.yazi')
require('plugins.flash')
require('plugins.surround')
require('plugins.minimap')
require('plugins.icons')
require('plugins.neoscroll')
require('plugins.automaton')
