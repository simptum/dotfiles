return {
  {
      'nvim-telescope/telescope.nvim',
      tag = 'v0.2.0',
      dependencies = { 'nvim-lua/plenary.nvim' },
  },

  {
  'nvim-lualine/lualine.nvim',
  commit = '221ce6b2d999187044529f49da6554a92f740a96',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'tpope/vim-fugitive',
    commit = '3b753cf'
  },
  {
    "neovim/nvim-lspconfig",
    commit = 'ee1e369'
  },

  {
  "mason-org/mason.nvim",
  commit = '2a6940a',
  opts = { ensure_installed = { "markdownlint-cli2", "markdown-toc" } }
  },

  {
  "MeanderingProgrammer/render-markdown.nvim",
  commit = '4663eb3',
    opts = {
      checkbox = {
        unchecked = { icon = '✘' },
        checked = {
          icon = '✔',
          highlight = "String",
        },
        custom = { todo = { rendered = '◯' } },
      },
      code = {
        sign = false,
        width = "block",
        left_pad = 2,
        right_pad = 2,
        border = 'thick',
      },
      heading = {
        sign = false,
        position = 'inline',
        icons = {''},
      },
      render_modes = true,
      anti_conceal = { enabled = false, }
    },
    ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
    config = function(_, opts)

      -- Colors
      vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', { fg = '#7aa2f7', bg = '#2a2b3d' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', { fg = '#FF9E64', bg = '#332821' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', { fg = '#9ECE6A', bg = '#282c28' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', { fg = '#F7768E', bg = '#2A1F2C' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', { fg = '#F7768E', bg = '#2A1F2C' })
      vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = '#24263a' })

      require("render-markdown").setup(opts)
        vim.keymap.set("n", "<leader>m", function()
        local render = require("render-markdown")
          if render.get() then
            render.disable()
          else
            render.enable()
          end
        end, { desc = "Toggle Render Markdown" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    commit = "cf12346",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup({
        ---@usage 'background'|'foreground'|'virtual'
        render = 'background', -- or 'virtual' to show a color square next to the hex code
        enable_hex = true,
        enable_short_hex = true,
      })
    end
  }
}
