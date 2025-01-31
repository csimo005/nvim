return {
  { "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config =  function()
      require("nvim-tree").setup({
	filters = {
          dotfiles = true,
        },
      })

      -- global
      vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent = true, noremap = true})
    end,
  },
}
