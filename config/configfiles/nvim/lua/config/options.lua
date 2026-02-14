-- Neovim options
local opt = vim.opt

-- Line numbers
opt.number = true            -- show absolute line numbers
opt.relativenumber = true    -- show relative line numbers

-- Tabs & indentation
opt.expandtab = true         -- use spaces instead of tabs
opt.shiftwidth = 2           -- indentation amount for < and >
opt.tabstop = 2              -- number of spaces tabs count for
opt.smartindent = true       -- smart auto-indent

-- Search
opt.ignorecase = true        -- ignore case in search
opt.smartcase = true         -- smart case search when uppercase letters used
opt.hlsearch = true          -- highlight search matches

-- Interface
opt.cursorline = true        -- highlight current line
opt.wrap = false             -- disable line wrap
opt.termguicolors = true     -- enable true colors
opt.signcolumn = "yes"       -- always show sign column (for LSP/gitsigns)
opt.scrolloff = 8            -- keep cursor 8 lines from top/bottom

-- Other quality of life
opt.updatetime = 300         -- faster completion & CursorHold events
opt.splitright = true        -- vertical split opens to the right
opt.splitbelow = true        -- horizontal split opens below

