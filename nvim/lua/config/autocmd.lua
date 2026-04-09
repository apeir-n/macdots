-- local function get_fg(group, fallback)
--     local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
--     if ok and hl and hl.fg then
--         return string.format('#%06x', hl.fg)
--     end
--     return fallback
-- end
--
-- -- streamline modeclrs
-- vim.api.nvim_create_autocmd('ModeChanged', {
--     callback = function()
--         local ok, mode = pcall(vim.fn.mode)
--         if not ok then return end
--
--         local hl = vim.api.nvim_set_hl
--
--         -- change these to pywal colors
--         -- local colors = require('pywal16.core').get_colors()
--         if mode == 'n' then
--             hl(0, 'StreamlineMode', { fg = get_fg('Special', '#D27E99'), bg = 'none', bold = true })
--         elseif mode == 'i' then
--             hl(0, 'StreamlineMode', { fg = get_fg('String', '#98BB6C'), bg = 'none', bold = true })
--         elseif mode == 'v' or mode == 'V' or mode == '\22' then
--             hl(0, 'StreamlineMode', { fg = get_fg('Type', '#7FB4CA'), bg = 'none', bold = true })
--         elseif mode == 'R' then
--             hl(0, 'StreamlineMode', { fg = get_fg('Title', '#D27E99'), bg = 'none', bold = true })
--         else
--             hl(0, 'StreamlineMode', { fg = get_fg('Comment', '#AAAAAA'), bg = 'none', bold = true })
--         end
--     end,
-- })

-- :w lint
vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function()
        require('lint').try_lint()
    end,
})

-- disable autocomment
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
    vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
    vim.highlight.on_yank({ timeout = 120 })
    end,
})

-- cursor restore
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line('$') then
        vim.cmd("normal! g'\"")
    end
end,
})

-- md syntax highlight
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'markdown',
    callback = function()
        vim.treesitter.start()
    end,
})

---- noconceal
---- uncomment if conceallevel != 0
--vim.api.nvim_create_autocmd('FileType', {
--  pattern = { 'json', 'jsonc', 'md' },
--  callback = function()
--    vim.opt_local.conceallevel = 0
--  end
--})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.g.colors_name == "kanso" then
            vim.defer_fn(function()
                vim.cmd("colorscheme kanso")
            end, 1)
        end
    end,
})
