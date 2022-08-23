local packer = require('packer')
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        -- 你的插件列表...
        --------------------- colorschemes --------------------
        -- tokyonight
        use('folke/tokyonight.nvim')
        -- OceanicNext
        use('mhartington/oceanic-next')
        -- gruvbox
        use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } })
        -- zephyr 暂时不推荐，详见上边解释
        use('glepnir/zephyr-nvim')
        -- nord
        use('shaunsingh/nord.nvim')
        -- onedark
        use('ful1e5/onedark.nvim')
        -- nightfox
        use('EdenEast/nightfox.nvim')
        -------------------------------------------------------
        -- nvim-tree
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        -- bufferline
        use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
        -- lualine
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        use('LinArcX/telescope-env.nvim')
        -- dashboard-nvim
        use('glepnir/dashboard-nvim')
        -- project
        use('ahmedkhalf/project.nvim')
        -- wakatime
        use('wakatime/vim-wakatime')
        -- treesitter
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        --------------------- LSP --------------------
        use({ 'williamboman/nvim-lsp-installer' })
        -- Lspconfig
        use({ 'neovim/nvim-lspconfig' })
        -- lspsaga
        use({
            'glepnir/lspsaga.nvim',
            branch = 'main',
        })
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        -- use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- 算法竞赛助手
        use('p00f/cphelper.nvim')
        -- ui
        use('onsails/lspkind-nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        -- 代码格式化
        use('mhartington/formatter.nvim')
        -- use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- 括号补全
        use('windwp/nvim-autopairs')
        -- 快捷注释
        use('numToStr/Comment.nvim')
        -- 更好的终端
        use({ 'akinsho/toggleterm.nvim', tag = 'v1.*' })
        -- 快捷加引号空格
        use('ur4ltz/surround.nvim')
        -- JSON 增强
        use('b0o/schemastore.nvim')
        -- markdown 预览
        use({
            'iamcco/markdown-preview.nvim',
            run = 'cd app && npm install',
            ft = { 'markdown' },
        })
        -- markdown 语法高亮
        use({ 'preservim/vim-markdown', requires = 'godlygeek/tabular' })
        -- markdown 一键生成目录
        use('mzlogin/vim-markdown-toc')
        -- Pangu 规范化中英文排版
        use('hotoo/pangu.vim')
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
    -- 每次保存 plugins.lua 自动安装插件
    pcall(
        vim.cmd,
        [[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
  ]]
    ),
})
