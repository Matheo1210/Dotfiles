local M = {}

local dashboard_headers = require "better-vim.dashboard-headers"
local utils = require "better-vim-utils"

M.theme = {
  -- name = "onedark",
  name = "catppuccin",
  -- name = "palenight",
  -- name = "ayu",
  -- name = "nightfox",

  catppuccin_flavour = "frappe",
  ayucolor = "dark",
  rose_pine = { variant = "moon" },
}

local function expand_relative_path()
  vim.cmd [[:let @+ = expand("%")]]
  print("Relative path copied to clipboard!")
end

local function expand_full_path()
  vim.cmd [[:let @+ = expand("%:p")]]
  print("Full path copied to clipboard!")
end

M.dashboard = {
  header = dashboard_headers.cbun,
}

M.mappings = {
  leader = ",",
  custom = {
    { "<leader>t", "<cmd>FloatermNew --width=0.8 --height=0.8<cr>", desc = "Open terminal" },
    { "<leader>f", "va}zf", desc = "Create folding" },
    { "<leader>yf", expand_relative_path, desc = "Copy relative file path" },
    { "<leader>yn", expand_full_path, desc = "Copy full file path" },
    { "<c-\\>", "<cmd>FloatermToggle!<cr>", desc = "Toggle Terminal", mode = { "t", "n" } },
    { "<c-q>", "<cmd>:qa<cr>", desc = "Close all buffers" },
    { "gp", ":e#<cr>", desc = "Switch between the lastest two buffers" },
    { "gd", "<leader>gd", desc = " Go to definition", remap = true },
    { "K", "<leader>cd", desc = " Show documentation", remap = true },
    { "<leader>br", "<cmd>Rest run<cr>", desc = "Run the request under the cursor" },
    { "<leader>ba", "<cmd>Rest run last<cr>", desc = "Re-run the last request" },
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Toggle Git Blame" },
    { "[c", function() require("treesitter-context").go_to_context(vim.v.count1) end, desc = "Jumping to context (upwards)", silent = true },
    -- Naming mappings groups
    { "<leader>b", group = "HTTP" },
    { "<leader>y", group = "Yank Path" },
  },
}

M.nvim_tree = {
  update_cwd = false,
  update_focused_file = {
    update_cwd = false,
  },
  -- view = {
  --   adaptive_size = false,
  -- },
  filters = {
    dotfiles = false,
    exclude = { "github.*" },
  },
}

M.lsps = {
  biome = {},
  astro = {},
  prismals = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    },
  },
  rust_analyzer = {},
  rescriptls = {},
  terraformls = {},
  tsserver = {
    on_attach = function(client, bufnr)
      require "twoslash-queries".attach(client, bufnr)
      local lsp_ts_utils = require "nvim-lsp-ts-utils"
      lsp_ts_utils.setup {
        filter_out_diagnostics_by_code = { 80001 },
      }
      lsp_ts_utils.setup_client(client)
    end,
  },
}

M.formatters = {
  terraform_fmt = {},
}

M.treesitter = "all"

M.plugins = {
  { "nvim-treesitter/nvim-treesitter-context" },
  -- {
  --   "vhyrro/luarocks.nvim",
  --   priority = 10000,
  --   config = true,
  --   opts = {
  --     rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" },
  --   },
  -- },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup {}
  --   end,
  -- },
  {
    "f-person/git-blame.nvim",
    opts = {
      enabled = false,
    },
  },
  "rescript-lang/vim-rescript",
  "rescript-lang/tree-sitter-rescript",
  "devongovett/tree-sitter-highlight",
  "voldikss/vim-floaterm",
  "jose-elias-alvarez/nvim-lsp-ts-utils",
  utils.should_load_theme("palenightfall", { "JoosepAlviste/palenightfall.nvim" }),
  "mg979/vim-visual-multi",
  {
    "marilari88/twoslash-queries.nvim",
    opts = {
      multi_line = true,  -- to print types in multi line mode
      highlight = "Type", -- to set up a highlight group for the virtual text
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "│",
      virtcolumn = "+1,80",
      exclude = {
        filetypes = { "dashboard" },
      },
    },
  },
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {},
  },
  "hashivim/vim-terraform",
  -- "Exafunction/codeium.vim",
}

local terminal_opened_status = function()
  local terminals = vim.inspect(vim.api.nvim_call_function("floaterm#buflist#gather", {}))
  local is_terminal_opened = #terminals > 2
  return is_terminal_opened and "󰆍" or ""
end

M.lualine = {
  options = {
    -- icons:
    --           
    component_separators = { left = "", right = "" },
    -- section_separators = { left = " ", right = "" },
    section_separators = { left = " ", right = "" },
  },
  sections = {
    a = { "mode" },
    b = { "branch" },
    -- c = { utils.statusline.get_file_name, terminal_opened_status },
    c = { "filename", terminal_opened_status },
    x = { "encoding", "fileformat", "filetype" },
    y = { "progress" },
    z = { "location" },
  },
}

M.noice = {
  messages = {
    view = "mini",
  },
  routes = {
    {
      filter = { event = "notify" },
      opts = { skip = true, title = "NvimTree" },
    },
  },
}

local telescope_file_ignore_patterns = { "node_modules", ".git/" }
M.telescope = {
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_lastused = true,
    },
    live_grep = {
      file_ignore_patterns = telescope_file_ignore_patterns,
      additional_args = function(_)
        return { "--hidden" }
      end,
    },
    find_files = {
      file_ignore_patterns = telescope_file_ignore_patterns,
      hidden = true,
    },
  },
}

M.unload_plugins = { "snippets", "noice" }

M.flags = {
  disable_tabs = true,
  format_on_save = true,
  experimental_tsserver = true,
}

M.hooks = {
  after_setup = function()
    -- Floatterm config
    vim.g.floaterm_title = ""

    vim.o.backupdir = "/tmp/.nvim/backup"
    vim.o.directory = "/tmp/.nvim/swap"
    vim.o.undodir = "/tmp/.nvim/undo"

    -- do not show ~ for blank lines
    vim.opt.fillchars = { eob = ' ' }

    -- -- ftdetect
    -- vim.cmd [[ autocmd BufNewFile,BufRead *.mdx set filetype=markdown.jsx ]]

    -- Set relative number when in normal mode and normal number in insert mode
    -- Code from plugin numbertoggle:
    -- https://github.com/sitiom/nvim-numbertoggle/blob/main/plugin/numbertoggle.lua
    local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

    vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
      pattern = "*",
      group = augroup,
      callback = function()
        if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
          vim.opt.relativenumber = true
        end
      end,
    })

    vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
      pattern = "*",
      group = augroup,
      callback = function()
        if vim.o.nu then
          vim.opt.relativenumber = false
          vim.cmd "redraw"
        end
      end,
    })

    vim.o.wildignore = ""

    -- Syntax highlight support for MDX
    vim.filetype.add({
      extension = {
        mdx = 'mdx',
      }
    })
    vim.treesitter.language.register('markdown', 'mdx')
    vim.treesitter.language.register('bash', 'sh')

    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- parser_config.rescript = {
    --   install_info = {
    --     url = "https://github.com/rescript-lang/tree-sitter-rescript",
    --     branch = "main",
    --     files = { "src/scanner.c" },
    --     generate_requires_npm = false,
    --     requires_generate_from_grammar = true,
    --     use_makefile = true, -- macOS specific instruction
    --   },
    -- }

    -- colorcolumn1
    -- -- colorcolumn from 80 to the end of the buffer width
    -- vim.cmd [[ let &colorcolumn=join(range(81,999),",") ]]

    -- colorcolumn2
    -- -- Show a different background color for texts that overlength
    -- vim.cmd [[
    --   augroup vimrc_autocmds
    --   au!
    --       autocmd BufRead * highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    --       autocmd BufRead * match OverLength /\%81v.*/
    --   augroup END
    -- ]]
  end,
}

return M
