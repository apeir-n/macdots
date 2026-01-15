----------------------------
--       bootstrap        --
----------------------------
local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
    vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vim.o.runtimepath = vim.o.runtimepath
    vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

local vim = vim
local Plug = vim.fn['plug#']

vim.cmd('filetype plugin on')

----------------------------

vim.call('plug#begin')

----------------------------
--         colors         --
----------------------------
Plug('sainnhe/edge')
Plug('sainnhe/sonokai')
Plug('sainnhe/everforest')
Plug('sainnhe/gruvbox-material')
Plug('rebelot/kanagawa.nvim')
Plug('webhooked/kanso.nvim')

----------------------------
--        plugins         --
----------------------------
Plug('nvim-treesitter/nvim-treesitter')
--Plug('nvim-treesitter/playground')
Plug('neovim/nvim-lspconfig')
Plug('mfussenegger/nvim-lint')
Plug('rcarriga/nvim-notify')
Plug('kylechui/nvim-surround')
Plug('windwp/nvim-autopairs')
Plug('norcalli/nvim-colorizer.lua')
Plug('nvim-tree/nvim-web-devicons')
Plug('folke/which-key.nvim')
Plug('goolord/alpha-nvim')
Plug('lewis6991/gitsigns.nvim')
Plug('numToStr/Comment.nvim')
Plug('zaldih/themery.nvim')
Plug('drgfunk/streamline.nvim')
Plug('folke/noice.nvim')
Plug('obsidian-nvim/obsidian.nvim')
Plug('MeanderingProgrammer/render-markdown.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('nanozuki/tabby.nvim')
Plug('mikavilpas/yazi.nvim')
Plug('folke/flash.nvim')
Plug('mrcjkb/rustaceanvim')
Plug('karb94/neoscroll.nvim')
Plug('eandrju/cellular-automaton.nvim' )
Plug('Isrothy/neominimap.nvim')
Plug('tidalcycles/vim-tidal')
--Plug('robbielyman/tidal.nvim')
--Plug('davidgranstrom/scnvim')

----------------------------
--          libs          --
----------------------------
Plug('nvim-lua/plenary.nvim')
Plug('MunifTanjim/nui.nvim')

----------------------------

vim.call('plug#end')

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
