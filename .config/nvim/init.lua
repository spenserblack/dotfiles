require("config.lazy")
require("lazy").setup("plugins")
vim.opt.title = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.mouse = ""
vim.opt.spell = true

-- show invisible characters
vim.opt.listchars = { space = "·", tab = ">-", eol = "$" }
vim.opt.list = true

require("colorscheme").setup({
  preferred_dark_colorscheme = "habamax",
  preferred_light_colorscheme = "default",
  theme_mode = "system",
})
