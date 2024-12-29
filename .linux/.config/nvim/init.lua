require("config.lazy")
require("lazy").setup("plugins")
vim.opt.title = true
vim.opt.number = true
vim.opt.statusline = "%.50f %m %R %= %l/%L (%c) %p%% %= 0x%B %Y"
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

-- As long as the terminal theme and the colorscheme match, a transparent background
-- should look good.
vim.cmd.highlight("Normal ctermbg=NONE guibg=NONE")

-- Neovide-specific settings
if vim.g.neovide then
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_ide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
end
