return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
    { "nvim-treesitter/nvim-treesitter-refactor", enabled = false },
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = ":TSUpdate",
  event = "VeryLazy",
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "go",
      "gomod",
      "html",
      "javascript",
      "json",
      "http",
      "lua",
      "markdown",
      "markdown_inline",
      "nix",
      "org",
      "php",
      "phpdoc",
      "query",
      "rust",
      "sql",
      "svelte",
      "typescript",
      "regex",
      "vim",
      "yaml",
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    autotag = {
      enable = true,
      enable_rename = true,
    },
    context_commentstring = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@conditional.outer",
          ["ic"] = "@conditional.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
      },
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
  }
}
