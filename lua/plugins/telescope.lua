return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    }
  },

  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
  keys = {
    {
      "<leader>gf",
      function()
        require('telescope.builtin').git_files({ show_untracked = true })
      end,
      desc = "Telescope Git File",
    },
    {
      "<leader>fb",
      function()
        require('telescope.builtin').buffers()
      end,
      desc = "Telescope Buffers",
    },
    {
      "<leader>gs",
      function()
        require('telescope.builtin').git_status()
      end,
      desc = "Telescope Git Status",
    },
    {
      "<leader>gc",
      function()
        require('telescope.builtin').git_bcommits()
      end,
      desc = "Telescope Git Commints",
    },
    {
      "<leader>gb",
      function()
        require('telescope.builtin').git_branches()
      end,
      desc = "Telescope Git Branches",
    },
    {
      "<leader>ff",
      function()
        require('telescope.builtin').find_files()
      end,
      desc = "Telescope Find Files",
    },
    {
      "<leader>bb",
      function()
        require('telescope').extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
      end,
      desc = "Telescope File Browser",
    },
  }
}
