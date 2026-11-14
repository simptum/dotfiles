-- Keybindings
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", function()
  local numbers_enabled = vim.wo.number or vim.wo.relativenumber

  vim.wo.number = not numbers_enabled
  vim.wo.relativenumber = not numbers_enabled
end)

vim.keymap.set("n", "<leader>?", function()
  vim.cmd("Inspect")
end)

vim.keymap.set('n', '<leader>fl', ':Lazy<CR>')

-- HSplit Man pages
vim.keymap.set('n', 'K', '<CMD>Man<CR>')

-- Git maps
vim.keymap.set('n', '<leader>gs', ':Git | only<CR>')

-- Telescope maps
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files,{ desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })

-- LSP keybinds
-- toggle diag messages
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

vim.keymap.set("n", "<leader>e", function()
  local enabled = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not enabled })
end, { desc = "Toggle diagnostic virtual text" })

-- Toggle TreeSitter
vim.keymap.set('n', '<leader>b', ':TSBufToggle bash<CR>')

-- Surround text
vim.keymap.set('n', '<leader>s', '<Nop>', { noremap = true })
local surrounds = {
  ['"'] = { '"', '"' },
  ["'"] = { "'", "'" },
  ['`'] = { '`', '`' },
  ['('] = { '(', ')' },
  ['['] = { '[', ']' },
  ['{'] = { '{', '}' },
  ['<'] = { '<', '>' },
  [')'] = { '(', ')' },
  [']'] = { '[', ']' },
  ['}'] = { '{', '}' },
  ['>'] = { '<', '>' },
}

for key, pair in pairs(surrounds) do
  vim.keymap.set('n', '<leader>sw' .. key,
    'ciw' .. pair[1] .. pair[2] .. '<Esc>P',
    { desc = 'Surround word with ' .. key }
  )
end


-- Visual mode mappings
vim.keymap.set("x", "<leader>c", ":'<,'>normal! I#<CR>:nohlsearch<CR>", { silent = true })

vim.keymap.set("x", "<leader>u", [[:<C-u>'<,'>s/^\(\s*\)#\s\?/\1/<CR>:nohlsearch<CR>]], { silent = true })

-- Surround text
vim.keymap.set('x', '<leader>s', '<Nop>', { noremap = true })
for key, pair in pairs(surrounds) do
  vim.keymap.set('x', '<leader>sw' .. key,
    'c' .. pair[1] .. pair[2] .. '<Esc>P',
    { desc = 'Surround word with ' .. key }
  )
end

