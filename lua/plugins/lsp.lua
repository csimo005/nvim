return {
  { "VonHeikemen/lsp-zero.nvim",
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Mason",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
              "pyright",
              "lua_ls",
              "clangd",
              "bashls",
	      "rust_analyzer",
	      "taplo",
	  },
	},
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
	config = function()
          require("mason-lspconfig").setup({
	    handlers = {
              function(server_name)
                require('lspconfig')[server_name].setup({})
              end,
	    },
          })
        end,
      },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/vim-vsnip" },
      { "L3MON4D3/LuaSnip" },
      { "SmiteshP/nvim-navic" },
      { "simrat39/rust-tools.nvim" },
    },
    config = function()
      local lsp = require("lsp-zero")
      local navic = require("nvim-navic")

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, bufnr)
          end
        end)

      lsp.setup()

      local cmp = require("cmp")
      -- local cmp_action = require('lsp-zero').cmp_action()

      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        preselect = cmp.PreselectMode.None,
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end
        }
      })

    end,
  },
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({ 
        ensure_installed = { "lua", "rust", "toml" },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting=false,
        },
        ident = { enable = true }, 
        rainbow = {
          enable = true,
          extended_mode = true,
          max_file_lines = nil,
        }
      })
    end,
  },
  { "puremourning/vimspector" },
}
