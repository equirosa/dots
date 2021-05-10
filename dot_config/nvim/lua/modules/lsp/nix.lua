local on_attach = require('modules.lsp.on_attach')

require'lspconfig'.rnix.setup {on_attach = on_attach}
