local lsp = require('lsp-zero')



lsp.omnifunc.setup({
  autocomplete = true,
  use_fallback = true,
  update_on_delete = true,
  trigger = '<C-Space>',
})
  require('mason').setup({})
  require('mason-lspconfig').setup({
    -- Replace the language servers listed here 
    -- with the ones you want to install
    ensure_installed = {
      'jdtls',
      'clangd',  
    },
    handlers = {
      function(server_name)
        require('lspconfig')[server_name].setup({})
      end,
    },
  })

local cmp = require('cmp')
local cmp_select = {behaviour = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lsp' },
  },
}) 

require('nvim-autopairs').setup{}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

--lsp.set_preferences({
 -- sign_icons = { }
--})
lsp.setup()
