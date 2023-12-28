vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
