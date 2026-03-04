-- =========== Leader Key ===========
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- =========== Basic Neovim Options ===========
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50"

-- =========== Plugin Setup via lazy.nvim ===========
require('lazy').setup({
  -- Packer itself is not needed anymore

  -- Treesitter for modern syntax highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate", -- run TSUpdate after install
    config = function()
      require'nvim-treesitter'.setup {        
        ensure_installed = { "typescript", "javascript", "svelte", "html", "css" },
        highlight = { enable = true },
        auto_install = true,
      }
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        integrations = { treesitter = true, coc_nvim = true },
      }
      vim.cmd [[colorscheme catppuccin]]
    end
  },

  -- Svelte syntax support
  { 'evanleck/vim-svelte' },

  -- Better TS syntax
  { 'HerringtonDarkholme/yats.vim' },

  {
      -- LSP
      "neovim/nvim-lspconfig",

      -- LSP installer
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  },

  -- Completion Engine
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP source
      'hrsh7th/cmp-buffer',   -- Buffer source
      'hrsh7th/cmp-path',     -- Path source
      'L3MON4D3/LuaSnip',     -- Snippet engine
      'saadparwaiz1/cmp_luasnip', -- Snippet source
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- Tab mapping for navigating suggestions
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end
  }


})

local opts = {silent = true, noremap = true, expr = true}

-- =========== Keybindings ===========
local map = vim.api.nvim_set_keymap

local mopts = {silent = true, noremap = true}

-- Save / Quit
map('n', '<leader>w', ':w<CR>', mopts)
map('n', '<leader>q', ':q!<CR>', mopts)
map('n', '<leader>e', ':Ex<CR>', mopts)
map('n', '<leader>v', ':vsplit<CR>', mopts)
map('n', '<leader>j', '<C-w>w', mopts)
map('n', '<leader>h', ':noh<CR>', mopts)


-- LSP
vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    root_markers = { 'package.json', 'tsconfig.json', '.git' },
})

vim.lsp.enable('ts_ls')

vim.o.updatetime = 250  -- faster hover trigger

vim.lsp.config('rust_analyzer', {
    cmd = { 'rust-analyzer' },
    filetypes = { 'rust' },
    root_markers = { 'Cargo.toml', '.git' },
    settings = {
        ["rust-analyzer"] = {
            cargo = { allFeatures = true },      -- see all crate features
            checkOnSave = { command = "clippy" }, -- run Clippy on save
            procMacro = { enable = true },       -- needed for wgpu / rapier macros
        },
    },
})

-- Enable the server
vim.lsp.enable('rust_analyzer')

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focus = false,
      scope = "cursor",
    })
  end,
})

vim.lsp.config('svelte', {
  cmd = { 'svelteserver', '--stdio' },
  filetypes = { 'svelte' },
  root_markers = { 'package.json', 'svelte.config.js', '.git' },

  settings = {
    svelte = {
      plugin = {
        typescript = {
          diagnostics = { enable = true },
          hover = { enable = true },
          completions = { enable = true },
        }
      }
    }
  },
})
vim.lsp.enable('svelte')

-- With:
vim.lsp.config('pyright', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  settings = {
    python = {
      analysis = { autoSearchPaths = true }
    }
  }
})
