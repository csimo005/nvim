return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      local onedark = require("onedark")
      onedark.setup({
	style = "warm"
      })
      onedark.load()
    end,
  },
  { 'danilamihailov/beacon.nvim' }
}
