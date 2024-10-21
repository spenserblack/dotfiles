require("config.lazy")
require("lazy").setup("plugins")
vim.opt.title = true
vim.opt.number = true
vim.opt.mouse = ""
vim.opt.spell = true

-- show invisible characters
vim.opt.listchars = { space = "·", tab = ">-", eol = "$" }
vim.opt.list = true

vim.opt.wrap = false
-- When wrapping, soft-wrap
-- (:help linebreak, :help breakat, :help breakindent, :help showbreak)
vim.opt.linebreak = true
vim.keymap.set({'i', 'n'}, '<M-z>', function() vim.opt.wrap = not vim.o.wrap end)

require("colorscheme").add_dark_colorscheme("rose-pine-main")
require("colorscheme").add_dark_colorscheme("rose-pine-moon")
require("colorscheme").add_light_colorscheme("rose-pine-dawn")

require("colorscheme").setup({
  preferred_dark_colorscheme = "rose-pine-moon",
  preferred_light_colorscheme = "rose-pine-dawn",
  theme_mode = "system",
  theme_mode_fallback = "dark",
})
