-- Load lazy.nvim
require("config.lazy")

-- Load plugins in lua/plugins/**.lua
require("lazy").setup("plugins")

-- Other options
vim.wo.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.tabstop = 4
