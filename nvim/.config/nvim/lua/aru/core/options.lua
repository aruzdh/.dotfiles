vim.opt.linebreak = true
vim.opt.wrap = true
vim.opt.showbreak = "»\\ "
vim.opt.breakindent = true
vim.opt.colorcolumn = "100"
vim.opt.title = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.scrolloff = 10
vim.opt.mouse = ""

vim.opt.inccommand = "split"
vim.opt.splitkeep = "cursor"
vim.opt.formatoptions:append({ "r" })
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

vim.g.lazyvim_picker = "fzf"
vim.opt.spelllang = "en_us,es"
