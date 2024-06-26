local fn = vim.fn

local function spell()
    if vim.o.spell then
        return string.format("[SPELL]")
    end

    return ""
end

local function ime_state()
    if vim.g.is_mac then
        -- ref: https://github.com/vim-airline/vim-airline/blob/master/autoload/airline/extensions/xkblayout.vim#L11
        local layout = fn.libcall(vim.g.XkbSwitchLib, 'Xkb_Switch_getXkbLayout', '')
        if layout == '0' then
            return '[CN]'
        end
    end

    return ""
end

local function trailing_space()
    -- Get the positions of trailing whitespaces from plugin 'jdhao/whitespace.nvim'.
    local trailing_space_pos = vim.b.trailing_whitespace_pos

    local msg = ""
    if #trailing_space_pos > 0 then
        -- Note that lua index is 1-based, not zero based!!!
        local line = trailing_space_pos[1][1]
        msg = string.format("[%d]trailing", line)
    end

    return msg
end

local function mixed_indent()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = fn.search(space_pat, 'nwc')
    local tab_indent = fn.search(tab_pat, 'nwc')
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line
    if not mixed then
        mixed_same_line = fn.search([[\v^(\t+ | +\t)]], 'nwc')
        mixed = mixed_same_line > 0
    end
    if not mixed then
        return ''
    end
    if mixed_same_line ~= nil and mixed_same_line > 0 then
        return 'MI:' .. mixed_same_line
    end
    local space_indent_cnt = fn.searchcount({
        pattern = space_pat,
        max_count = 1e3
    }).total
    local tab_indent_cnt = fn.searchcount({
        pattern = tab_pat,
        max_count = 1e3
    }).total
    if space_indent_cnt > tab_indent_cnt then
        return 'MI:' .. tab_indent
    else
        return 'MI:' .. space_indent
    end
end

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