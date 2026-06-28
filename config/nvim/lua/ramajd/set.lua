local opts = vim.opt

-- Tab configuration
opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2
opts.expandtab = true
opts.autoindent = true
opts.smartindent = true
opts.smarttab = true
opts.list = true
opts.listchars = "eol:.,tab:>-,trail:~,extends:>,precedes:<"

-- line numbers configuration
opts.number = true
opts.relativenumber = true
opts.cursorline = true
opts.signcolumn = "yes:1"
opts.scrolloff = 8
opts.showcmd = true

opts.swapfile = false
opts.backup = false
opts.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
opts.undofile = true
opts.clipboard = "unnamed"

opts.hlsearch = true
opts.incsearch = true
opts.ignorecase = true
opts.smartcase = true

opts.termguicolors = true
opts.showmode = false

-- no automatic comment insertion
vim.cmd([[autocmd FileType * set formatoptions-=ro]])
