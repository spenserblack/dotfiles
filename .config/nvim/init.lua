require("config.lazy")
require("lazy").setup("plugins")
vim.opt.title = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.mouse = ""
vim.opt.spell = true

-- show invisible characters
vim.opt.listchars = { space = ".", tab = ">-", eol = "$" }
vim.opt.list = true

vim.cmd.colorscheme("shine")

vim.keymap.set('n', '<C-c><down>', '<cmd>ColorschemeCycle next<cr>')
vim.keymap.set('n', '<C-c><up>', '<cmd>ColorschemeCycle prev<cr>')
