local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require "packer"
-- Add packages
return packer.startup(
    function()
        use "wbthomason/packer.nvim" -- packer can manage itself

        -- nvim-tree file-expolier 左侧状态栏
        use "kyazdani42/nvim-tree.lua"
        -- lualine 底部状态栏
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "arkav/lualine-lsp-progress",
                "kyazdani42/nvim-web-devicons",
                opt = true
            }
        }
        -- lualine 插件
        -- use "arkav/lualine-lsp-progress"
        -- nvim-gps
        use {
            "SmiteshP/nvim-gps",
            requires = "nvim-treesitter/nvim-treesitter"
        }
        -- bufferline 顶部状态栏
        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons"
        }
        use "famiu/bufdelete.nvim"
        -- telescople 文件查找
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim", -- Lua 开发模块
                "BurntSushi/ripgrep", -- 文字查找
                "sharkdp/fd" -- 文件查找
            }
        }
        -- toggleterm terminal 终端
        use {"akinsho/toggleterm.nvim"}
        -- nvim-treesitter 语法高亮
        use {
            "nvim-treesitter/nvim-treesitter",
            run = {":TSupdate"},
            requires = {
                "p00f/nvim-ts-rainbow"
            }
        }
        use {
            "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
            requires = {
                {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
                {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
                {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
                {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
                {"hrsh7th/cmp-path"}, -- 路径补全
                {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
                {"hrsh7th/cmp-cmdline"}, -- 命令补全
                {"f3fora/cmp-spell"}, -- 拼写建议
                {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
                {"lukas-reineke/cmp-under-comparator"} -- 让补全结果的排序更加智能
                -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
            }
        }
        -- undo tree
        use {
            "mbbill/undotree"
        }
        -- fidget lsp 加载进度提示
        use {
            "j-hui/fidget.nvim"
        }
        -- lspconfig lsp 基础服务 配置语言
        use {
            "neovim/nvim-lspconfig"
        }
        -- 插入模式查看函数的签名信息
        use "ray-x/lsp_signature.nvim"
        -- 灯泡提示行为
        -- use "kosayoda/nvim-lightbulb"
        -- nvim-lsp-installer lsp 安装
        use "williamboman/nvim-lsp-installer"
        -- lspsaga lsp提示美化
        use "tami5/lspsaga.nvim"

        -- comment 注释
        use {
            "numToStr/Comment.nvim",
            requires = {
                "JoosepAlviste/nvim-ts-context-commentstring"
            }
        }

        -- 代码调试基础插件
        use {
            "mfussenegger/nvim-dap"
        }

        -- 为代码调试提供内联文本
        use {
            "theHamsta/nvim-dap-virtual-text",
            requires = {
                "mfussenegger/nvim-dap"
            }
        }

        -- 为代码调试提供 UI 界面
        use {
            "rcarriga/nvim-dap-ui",
            requires = {
                "mfussenegger/nvim-dap"
            }
        }

        -- format 格式化
        use "sbdchd/neoformat"
        -- vista 大纲视图
        use "liuchengxu/vista.vim"
        -- which-key
        use "folke/which-key.nvim"
        -- Icons
        use "kyazdani42/nvim-web-devicons"
        -- Themes
        use "shaunsingh/nord.nvim"
        use "rmehri01/onenord.nvim"
        -- dashboard
        -- use 'glepnir/dashboard-nvim'
        use {
            "goolord/alpha-nvim",
            requires = {"kyazdani42/nvim-web-devicons"}
            -- config = function ()
            --     require'alpha'.setup(require'alpha.themes.dashboard'.config)
            -- end
        }
        -- autosave
        use "Pocco81/AutoSave.nvim"
        -- nvim-hlslens 搜索时显示数目
        use "kevinhwang91/nvim-hlslens"
        -- indent-blankline 缩进提示
        use "lukas-reineke/indent-blankline.nvim"
        -- autopairs 自动补全括号
        use "windwp/nvim-autopairs"
        -- hop
        use "phaazon/hop.nvim"
        -- surround
        use "ur4ltz/surround.nvim"
        -- lastplace 停留在上次编辑
        use "ethanholz/nvim-lastplace"
        -- nvim-scrollbar
        use "petertriho/nvim-scrollbar"
        -- nvim-notify
        use "rcarriga/nvim-notify"
        -- tmux-nvim
        use(
            {
                "aserowy/tmux.nvim",
                config = function()
                    require("tmux").setup(
                        {
                            -- overwrite default configuration
                            -- here, e.g. to enable default bindings
                            copy_sync = {
                                -- enables copy sync and overwrites all register actions to
                                -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
                                enable = true
                            },
                            navigation = {
                                -- enables default keybindings (C-hjkl) for normal mode
                                enable_default_keybindings = true
                            },
                            resize = {
                                -- enables default keybindings (A-hjkl) for normal mode
                                enable_default_keybindings = true
                            }
                        }
                    )
                end
            }
        )
	
        use(
            {
                "karb94/neoscroll.nvim",
                config = function()
                    require("neoscroll").setup(
                        {
                            -- All these keys will be mapped to their corresponding default scrolling animation
                            mappings = {
                                "<C-u>",
                                "<C-d>",
                                "<C-b>",
                                "<C-f>",
                                "<C-y>",
                                "<C-e>",
                                "zt",
                                "zz",
                                "zb",
                            },
                            hide_cursor = true, -- Hide cursor while scrolling
                            stop_eof = true, -- Stop at <EOF> when scrolling downwards
                            use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                            respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                            easing_function = nil, -- Default easing function
                            pre_hook = nil, -- Function to run before the scrolling animation starts
                            post_hook = nil, -- Function to run after the scrolling animation ends
                            performance_mode = false -- Disable "Performance Mode" on all buffers.
                        }
                    )
                end
            }
        )
        -- gitsigns
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }
    end
)
