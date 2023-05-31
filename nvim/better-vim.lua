local M = {}

M.noice = {
  cmdline = {
    format = {
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    },
  },
  messages = {
    enabled = true,
    view = "mini",
    view_error = "mini",
    view_warn = "mini",
    view_history = "messages",
    view_search = "virtualtext",
  },
}

M.plugins = {
  "rescript-lang/vim-rescript",
  "nkrkv/nvim-treesitter-rescript",
  "devongovett/tree-sitter-highlight",
  "Heliferepo/VimTek",
  "github/copilot.vim"
}

M.mappings = {
  leader = "\\",
  custom = {
    ["<leader>t"] = { "<cmd>ToggleTerm direction=float<cr>", "Toggle Terminal" },
    ["<s-k>"] = { "5kzz", "Jump 5 lines above" },
    ["<s-j>"] = { "5jzz", "Jump 5 lines below" },
  }
}

M.theme = {
  name = "catppuccin",
  catppuccin_flavour = "mocha",
}

M.flags = {
  disable_tabs = true
}

M.nvim_tree = {
  view = {
    adaptive_size = false
  }
}

M.lualine = {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
}

M.hooks = {
  after_setup = function()
    vim.cmd("set relativenumber")
  end
}

M.lsps = {
    -- LSPs
  clangd = {},
  cssls = {},
  pylsp = {},
  tailwindcss = {},
  html = {},
  sqlls = {},
}

M.treesitter = {"c", "c_sharp", "css", "html", "javascript", "json", "lua", "python", "typescript", "cpp", "php", "sql"}

return M
