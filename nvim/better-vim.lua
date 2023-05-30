local lsps = require "better-vim.lsps"
local nvim_tree = require "better-vim.nvim-tree"
local lualine = require "better-vim.lualine"
local custom_mappings = require "better-vim.custom-mappings"
local plugins = require "better-vim.plugins"

return {
  theme = {
    name = "catppuccin",
    catppuccin_flavour = "mocha",
  },
  mappings = {
    leader = ",",
    custom = custom_mappings,
  },
  nvim_tree = nvim_tree,
  lsps = lsps,
  treesitter = {"c", "c_sharp", "css", "html", "javascript", "json", "lua", "python", "typescript", "cpp", "php", "sql"},
  plugins = plugins,
  lualine = lualine,
  flags = {
    disable_tabs = true,
  },
  hooks = {
    after_setup = function()
      -- Floatterm config
      vim.g.floaterm_title = ""

      -- ftdetect
      vim.cmd [[ autocmd BufNewFile,BufRead *.mdx set filetype=markdown.jsx ]]
    end,
    vim.cmd [[
    imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
    ]]
  },
}
