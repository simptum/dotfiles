local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    initial_mode = "normal",
    mappings = {
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["q"] = actions.close,
        ["/"] = function()
          vim.cmd("startinsert!")
        end,
      }
    }
  },
  pickers = {
    find_files = {
      hidden = true
    }
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
