local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
})

-- Set configuration for specific filetype.
cmp.setup.buffer({
  sources = {
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
  },
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities

require('lspconfig')['tsserver'].setup {
  capabilities = capabilities,
}

require('lspconfig')['clangd'].setup {
  capabilities = capabilities,
}

