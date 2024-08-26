local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

return lazy.setup({
    -- Telescope with dependencies
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',

    -- Rose Pine theme
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- Treesitter configurations and related tools
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {},
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },
    "apple/pkl-neovim",

    -- Other useful plugins
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-vinegar',

    {
        "neovim/nvim-lspconfig",

        dependencies = {
            "williamboman/mason.nvim",
            "VonHeikemen/lsp-zero.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            'hrsh7th/nvim-cmp',
            'octaltree/cmp-look',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip'
        },

        config = function()
            local lspconfig = require("lspconfig")
            local mason = require("mason")

            mason.setup()
        end,
    },
    -- Auto pairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {},
   },
    {
        "jbyuki/instant.nvim",
        config = function()
            vim.g.instant_username = "juliuswaldmann"
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
      "gbprod/cutlass.nvim",
      opts = {
          cut_key = "m",
          override_del = nil,
          exclude = {},
          registers = {
            select = "_",
            delete = "_",
            change = "_",
          },
       }
    },
    {
        "gennaro-tedesco/nvim-possession",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = true,
        init = function()
            local possession = require("nvim-possession")
            vim.keymap.set("n", "<leader>sl", function()
                possession.list()
            end)
            vim.keymap.set("n", "<leader>sn", function()
                possession.new()
            end)
            vim.keymap.set("n", "<leader>su", function()
                possession.update()
            end)
            vim.keymap.set("n", "<leader>sd", function()
                possession.delete()
            end)
        end,
    },
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    },
    {
        "gelguy/wilder.nvim",
        config = function ()
            local wilder = require('wilder')
            wilder.setup({modes = {':', '/', '?'}})
        end,
    },
    {
      "willothy/flatten.nvim",
      config = true,
      -- or pass configuration with
      -- opts = {  }
      -- Ensure that it runs first to minimize delay when opening file from terminal
      lazy = false,
      priority = 1001,
    },
    --{'romgrk/barbar.nvim',
    --  dependencies = {
    --    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --  },
    --  init = function() vim.g.barbar_auto_setup = false end,
    --  opts = {
    --    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --    -- animation = true,
    --    -- insert_at_start = true,
    --    -- …etc.
    --  },
    --  version = '^1.0.0', -- optional: only update when a new 1.x version is released
    --},
    {
      dir = "~/Documents/code/here.nvim",
      name = "here",
      config = function ()
          require("here")
      end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }

    -- Uncomment these lines if you want to use the plugins
    -- use 'nvim-tree/nvim-tree.lua'
    -- use 'nvim-tree/nvim-web-devicons'
    -- use {'github/copilot.vim', branch = 'release' }
})
