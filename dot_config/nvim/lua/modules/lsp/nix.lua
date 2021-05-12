local on_attach = require('modules.lsp.on_attach')
local lsp_config = require('lspconfig')

-- require'lspconfig'.rnix.setup {on_attach = on_attach}
lsp_config.rnix.setup {}
