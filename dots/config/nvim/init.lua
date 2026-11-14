-- Main
vim.g.user = {
  leaderkey = ' ',
  transparent = false,
  event = 'UserGroup',
  config = {
    undodir = vim.fn.stdpath('cache') .. '/undo',
  },
}

vim.api.nvim_create_augroup(vim.g.user.event, {})

-- Options
local opt = vim.opt

opt.foldmethod = "marker"
opt.syntax = "on"
opt.autoindent = true
opt.wrap = true
opt.number = true
opt.relativenumber = true

opt.expandtab = true
-- opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true

opt.ttimeoutlen = 0
opt.cursorline = true

opt.showmode = false
opt.termguicolors = true
-- opt.background = "dark"

opt.mouse=

vim.cmd("colorscheme custom")

-- Highlight settings
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('hi Normal guibg=#1a1b26 ctermbg=NONE')


-- Autocommands
local bash_group = vim.api.nvim_create_augroup("BashSyntax", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sh",
    group = bash_group,
    callback = function()
        vim.cmd("highlight Comment cterm=italic gui=italic")
        vim.cmd("highlight Keyword cterm=italic gui=italic")
        vim.cmd("highlight Identifier cterm=italic gui=italic")
    end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.g.user.event,
  callback = function(args)
    local valid_line = vim.fn.line([['"]]) >= 1 and vim.fn.line([['"]]) < vim.fn.line('$')
    local not_commit = vim.b[args.buf].filetype ~= 'commit'

    if valid_line and not_commit then
      vim.cmd([[normal! g`"]])
    end
  end,
})

-- Create an augroup
local close_with_q_group = vim.api.nvim_create_augroup("CloseWithQ", { clear = true })

-- Tab size of 2 for specific filetypes:

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript", "typescript", "javascriptreact", "typescriptreact",
    "html", "css", "json", "yaml", "lua", "markdown",
  },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Textwidth for markdown 
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "markdown", "txt", "gitcommit"
  },
  callback = function()
    vim.opt_local.textwidth = 72
    vim.opt_local.textwidth = 72
    vim.opt_local.spell = true
  end,
})

-- Create the autocmd
vim.api.nvim_create_autocmd("FileType", {
  group = close_with_q_group,
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})


vim.g.netrw_scp_cmd = "scp"

-- Scroll settings
opt.scrolloff = 5
opt.sidescroll = 5

vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.opt.spelllang = 'en_us'

require("config.lazy")
require("config.treesitter")
require("config.telescope")
require("config.lualine")
require("config.filetypes")
require("config.keymaps")

-- Jump between errors
local function jump_diag(count)
  return function()
    vim.diagnostic.jump({ count = count })
  end
end

vim.keymap.set("n", "<leader>dj", jump_diag(1), { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>dk", jump_diag(-1), { desc = "Previous diagnostic" })

-- LSPs
vim.lsp.config("bashls", require("lsp-configs.bashls"))
vim.lsp.enable('bashls')
--require('lualine').setup()
