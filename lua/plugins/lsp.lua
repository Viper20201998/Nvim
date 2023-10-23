return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }


    keymap.set('n', '<space>e', vim.diagnostic.open_float)
    keymap.set('n', '[d', vim.diagnostic.goto_prev)
    keymap.set('n', ']d', vim.diagnostic.goto_next)
    keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    local on_attach = function(_, bufnr)
      vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
      keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', '<space>k', vim.lsp.buf.hover, opts)
      keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
      keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      keymap.set('n', '<space>d', vim.lsp.buf.type_definition, opts)
      keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end
    require("neodev").setup()
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    local servers = { "tsserver", "html", "lua_ls", "emmet_ls" }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  end
}
