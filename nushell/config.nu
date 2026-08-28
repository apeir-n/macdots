# config.nu
#
# Installed by:
# version = "0.114.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = "hx"
$env.config.edit_mode = "vi"
$env.config.show_banner = false

# table.mode (string): Visual border style for tables.
# One of: "rounded", "basic", "compact", "compact_double", "light", "thin",
# "with_love", "reinforced", "heavy", "none", "psql", "markdown", "dots",
# "restructured", "ascii_rounded", "basic_compact", "single", "double",
# "frameless".
# Can be overridden with `| table --theme/-t`.
# Default: "rounded"
$env.config.table.mode = "rounded"
$env.config.table.missing_value_symbol = "-"


# menus (list): Menu configurations for Reedline.
# Menus are typically activated via keybindings.
# See https://www.nushell.sh/book/line_editor.html#menus for details.
#
# Each menu must declare its input behavior with one of:
#   input_mode: "diff", "cursor_prefix", or "full_buffer" -- what text the
#     menu source receives ("diff": only text typed since the menu opened,
#     "cursor_prefix": the buffer up to the cursor, "full_buffer": the whole
#     buffer)
#   only_buffer_difference (legacy): true is equivalent to input_mode "diff",
#     false to "cursor_prefix"
# input_mode supersedes only_buffer_difference when both are set.
#
# Menus may also set output_mode: "suggested_span", "full_buffer", or
# "extend_to_end" -- how an accepted suggestion replaces the buffer.
# Unset is equivalent to "suggested_span".
#
# List-layout menus accept description_position: "before" or "after" in their
# `type` record, controlling whether an entry's description is shown before or
# after its value. Unset keeps reedline's default.
# Default: []
# $env.config.menus = []

# Example: Custom completion menu configuration:
# $env.config.menus ++= [{
#     name: completion_menu
#     only_buffer_difference: false
#     marker: "| "
#     type: {
#         layout: columnar
#         columns: 4
#         col_width: 20
#         col_padding: 2
#     }
#     style: {
#         text: green
#         selected_text: green_reverse
#         description_text: yellow
#     }
# }]

# Example: The same menu using input/output modes instead of the legacy flag:
# $env.config.menus ++= [{
#     name: completion_menu
#     input_mode: cursor_prefix
#     output_mode: suggested_span
#     marker: "| "
#     type: {
#         layout: columnar
#         columns: 4
#         col_width: 20
#         col_padding: 2
#     }
#     style: {
#         text: green
#         selected_text: green_reverse
#         description_text: yellow
#     }
# }]

# Example: A list menu placing descriptions after each entry:
# $env.config.menus ++= [{
#     name: history_menu
#     input_mode: diff
#     marker: "? "
#     type: {
#         layout: list
#         page_size: 10
#         description_position: after
#     }
#     style: {
#         text: green
#         selected_text: green_reverse
#         description_text: yellow
#     }
# }]

$env.config.keybindings ++= [
    {
        name : insert_newline
        modifier : control
        keycode : char_j
        mode : vi_insert
        event : { edit : insertnewline }
    }
    {
        name : hint_accept
        modifier : control
        keycode : char_n
        mode : vi_insert
        event : { send : historyhintcomplete }
    }
    {
        name : hint_accept_word
        modifier : control
        keycode : char_k
        mode : vi_insert
        event : { send : historyhintwordcomplete }
    }
]

# $env.config.keybindings ++= [
#     {
#         name: completion_menu
#         modifier: control
#         keycode: char_t
#         mode: [vi_insert vi_normal]
#         event: {
#             until: [
#                 { send: menu name: completion_menu }
#                 { send: menupagenext }
#             ]
#         }
#     }
#     {
#         name: history_menu
#         modifier: control
#         keycode: char_y
#         mode: [vi_insert vi_normal]
#         event: {
#             until: [
#                 { send: menu name: history_menu }
#                 { send: menupagenext }
#             ]
#         }
#     }
# ]

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	^yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != $env.PWD and ($cwd | path exists) {
		cd $cwd
	}
	rm -fp $tmp
}

$env.config.color_config = {
    separator: default
    leading_trailing_space_bg: { attr: n }
    header: green
    empty: blue
    bool: light_cyan
    int: default
    filesize: cyan
    duration: default
    datetime: purple
    range: default
    float: default
    string: default
    nothing: default
    binary: default
    binary_null_char: dark_gray
    binary_printable: cyan
    binary_whitespace: green
    binary_ascii_other: purple
    binary_non_ascii: yellow
    cell-path: default
    row_index: green
    record: default
    list: default
    closure: green
    glob: light_cyan
    semver: cyan
    semver-range: cyan
    block: default
    hints: dark_gray
    search_result: { bg: red fg: default }
    shape_binary: light_magenta
    shape_block: blue
    shape_bool: light_cyan
    shape_closure: light_green
    shape_custom: green
    shape_datetime: light_cyan
    shape_directory: cyan
    shape_external: cyan
    shape_externalarg: green
    shape_external_resolved: light_yellow
    shape_filepath: cyan
    shape_flag: blue
    shape_float: light_magenta
    shape_glob_interpolation: cyan_italic
    shape_globpattern: cyan
    shape_int: magenta
    shape_internalcall: cyan
    shape_keyword: light_red
    shape_list: cyan
    shape_literal: blue
    shape_match_pattern: green
    shape_matching_brackets: { attr: u }
    shape_nothing: light_cyan
    shape_operator: yellow
    shape_pipe: magenta
    shape_range: yellow_italic
    shape_record: cyan
    shape_redirection: light_magenta
    shape_signature: light_green_italic
    shape_string: green
    shape_string_interpolation: cyan
    shape_table: blue
    shape_variable: magenta
    shape_vardecl: magenta
    shape_raw_string: light_magenta
    shape_garbage: {
        fg: default
        bg: red
        attr: d
    }
}

$env.LS_COLORS = "di=1;34:*.nu=3;95:ex=3;93:fi=37:ln=96"

$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = { || $"(ansi white)|- " }
$env.PROMPT_INDICATOR_VI_INSERT = { || $"(ansi white)|> " }

$env.TRANSIENT_PROMPT_COMMAND = "~~> "
$env.TRANSIENT_PROMPT_INDICATOR_VI_NORMAL = ""
$env.TRANSIENT_PROMPT_INDICATOR_VI_INSERT = ""
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = "::: "

$env.PROMPT_COMMAND = { ||
    let clock = date now | format date '%I:%M%P'
    let available = sys mem | get available | into int
    let total = sys mem | get total | into int
    let percentage = (1 - ($available / $total)) * 100
    # green and cyan

    # let module_apple = { fg : magenta, bg : light_red }
    let module_apple = { fg : yellow, bg : light_red }
    # let module_apple = { fg : red, bg : light_red }
    let separator_apple = { fg : light_red, bg : light_yellow }
    let apple = ([
        (ansi light_red)
        ("")
        (ansi --escape $module_apple)
        ("")
        (ansi --escape $separator_apple)
        ("")
    ] | str join)

    # let module_shell = { fg : green, bg : light_yellow }
    let module_shell = { fg : green, bg : light_yellow }
    # let module_shell = { fg : yellow, bg : light_yellow }
    let separator_shell = { fg : light_yellow, bg : light_green }
    let shell = ([
        (ansi --escape $module_shell)
        ("   nu")
        (ansi --escape $separator_shell)
        ("")
    ] | str join)

    # let module_memory = { fg : red, bg : light_green }
    let module_memory = { fg : blue, bg : light_green }
    # let module_memory = { fg : green, bg : light_green }
    let separator_memory = { fg : light_green, bg : light_blue }
    let mem = ([
        (ansi --escape $module_memory)
        ("  ")
        ($percentage | math round --precision 2 | into string)
        ("%")
        (ansi --escape $separator_memory)
        ("")
    ] | str join)

    # let module_user = { fg : yellow, bg : light_blue }
    let module_user = { fg : magenta, bg : light_blue }
    # let module_user = { fg : blue, bg : light_blue }
    let separator_user = { fg : light_blue, bg : light_magenta }
    let user = ([
        (ansi --escape $module_user)
        ("  ")
        ($env.user)
        (ansi --escape $separator_user)
        ("")
    ] | str join)

    # let module_host = { fg : cyan, bg : light_magenta }
    let module_host = { fg : red, bg : light_magenta }
    # let module_host = { fg : magenta, bg : light_magenta }
    let separator_host = { fg : light_magenta, bg : attr_hidden }
    let host = ([
        (ansi --escape $module_host)
        ("  ")
        (sys host | get hostname)
        (ansi --escape $separator_host)
        ("")
    ] | str join)

    let dir = match (do -i { $env.PWD | path relative-to $nu.home-dir}) {
        null          => $env.PWD
        ''            => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let bar_seg = $"($apple)($shell)($mem)($user)($host)(ansi reset)"
    let path_seg = $"╭── 󱣻  ($clock) | ($dir)"
    let prompt_seg = $"╰─"
    $"\n($bar_seg)\n(ansi white)($path_seg)\n($prompt_seg)(ansi reset)"
}

# on tmux i have the colors:
# active   : bg = light_magenta, i = blue, w = green
# inactive : bg = light_yellow,  i = red,  w = yellow
# right    : bg = light_red,     fg = dark_gray
