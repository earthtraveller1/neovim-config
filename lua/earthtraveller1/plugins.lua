local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("earthtraveller1.plugins.colorscheme"),
    require("earthtraveller1.plugins.telescope"),
    require("earthtraveller1.plugins.lualine"),
    require("earthtraveller1.plugins.nvim-tree"),
    require("earthtraveller1.plugins.treesitter"),
    require("earthtraveller1.plugins.fugitive"),
    require("earthtraveller1.plugins.flash"),
})
