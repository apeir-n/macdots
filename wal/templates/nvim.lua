-- require('wal').setup()

local M = {{}}

function M.setup()
    local colors = {{
        fg             = 'NONE',
        bg             = 'NONE',
        black          = '{color0}',
        red            = '{color1}',
        green          = '{color2}',
        yellow         = '{color3}',
        blue           = '{color4}',
        magenta        = '{color5}',
        cyan           = '{color6}',
        white          = '{color7}',
        bright_black   = '{color8}',
        bright_red     = '{color9}',
        bright_green   = '{color10}',
        bright_yellow  = '{color11}',
        bright_blue    = '{color12}',
        bright_magenta = '{color13}',
        bright_cyan    = '{color14}',
        bright_white   = '{color15}',
    }}

    local highlights = {{
        Normal = {{ fg = colors.white, bg = colors.bg }},
        NormalFloat = {{ fg = colors.white, bg = colors.bg }},
        FloatBorder = {{ fg = colors.bright_black, bg = colors.bg }},
        Visual = {{ bg = colors.bright_blue }},
        Search = {{ bg = colors.bright_green }},
        CursorLine = {{ fg = colors.color15, bg = colors.color7 }},
        StatusLine = {{ fg = colors.fg, bg = colors.fg }},
        Comment = {{ fg = colors.bright_black, italic = true }},
        Constant = {{ fg = colors.bright_red }},
        Number = {{ fg = colors.yellow }},
        String = {{ fg = colors.green }},
        Identifier = {{ fg = colors.blue }},
        Function = {{ fg = colors.cyan }},
        Statement = {{ fg = colors.magenta }},
        Special = {{ fg = colors.bright_yellow }},
        Type = {{ fg = colors.bright_cyan }},
        Error = {{ fg = colors.red }},

        -- ["@variable"] = {{ fg = colors.white }},
        -- ["@keyword"] = {{ fg = colors.white }},

        -- TelescopeBorder = {{ fg = colors.white }},
    }}

    for group, opts in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, opts)
    end

end

return M
