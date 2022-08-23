local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local opts = {
    default_config = {
        -- Update the path to prosemd-lsp
        filetypes = { 'markdown' },
        cmd = { '~/.local/share/nvim/lsp_servers/prosemd_lsp', '--stdio' },
        root_dir = function(fname)
            return lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        settings = {},
    },
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require('keybindings').mapLSP(buf_set_keymap)
    end,
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
