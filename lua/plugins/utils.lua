return {
  { "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  { "goolord/alpha-nvim",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
    config = function ()
      local startify = require("alpha.themes.startify")
      startify.file_icons_provider = "devicons"
      require("alpha").setup(
        startify.config
      )
    end,
  },
  { "RRethy/vim-illuminate" },
  { "tpope/vim-surround" },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  { "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  { "numToStr/Comment.nvim" },
}
