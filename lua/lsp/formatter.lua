local status, formatter = pcall(require, 'formatter')
if not status then
    vim.notify('没有找到 formatter')
    return
end

local util = require('formatter.util')

formatter.setup({
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = {
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        '-',
                    },
                    stdin = true,
                }
            end,
        },
        cpp = {
            function()
                return {
                    exe = 'clang-format',
                    args = {
                        '-assume-filename',
                        util.escape_path(util.get_current_buffer_file_name()),
                    },
                    stdin = true,
                    try_node_modules = true,
                }
            end,
        },
    },
})

-- format on save
vim.api.nvim_exec(
    [[
    augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.lua FormatWrite
    autocmd BufWritePost *.cpp FormatWrite
    augroup END
]],
    true
)
