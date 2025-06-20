require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        section_separators = "",
        component_separators = "",
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"filename", {
            ime_state,
            color = {
                fg = 'black',
                bg = '#f46868'
            }
        }, {
            spell,
            color = {
                fg = 'black',
                bg = '#a7c080'
            }
        }},
        lualine_x = {"encoding", {
            "fileformat",
            symbols = {
                unix = "unix",
                dos = "win",
                mac = "mac"
            }
        }, "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location", {
            "diagnostics",
            sources = {"nvim_diagnostic"}
        }, {
            trailing_space,
            color = "WarningMsg"
        }, {
            mixed_indent,
            color = "WarningMsg"
        }}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'quickfix', 'fugitive', 'nvim-tree'}
})