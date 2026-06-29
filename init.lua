-- Tab's
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.number = true
-- vim.o.relativenumber = true

-- Colorscheme
-- vim.cmd("colorscheme unokai")

-- Filetype plugins
vim.cmd("filetype plugin on")

-- Plugins
vim.cmd("call plug#begin()")

vim.cmd("Plug 'neovim/nvim-lspconfig'")
-- vim.cmd("Plug 'junegunn/fzf'")
vim.cmd("Plug 'nvim-lua/plenary.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }")
vim.cmd("Plug 'nvim-telescope/telescope.nvim'")
vim.cmd("Plug 'xiyaowong/transparent.nvim'")
vim.cmd("Plug 'cpea2506/one_monokai.nvim'")
vim.cmd("Plug 'EdenEast/nightfox.nvim'")
vim.cmd("Plug 'saghen/blink.lib'")
vim.cmd("Plug 'saghen/blink.cmp'")

vim.cmd("call plug#end()")

require("one_monokai").setup({
  transparent = true
})

require("blink.cmp").build():pwait()

require("blink.cmp").setup({
  cmdline = {
    enabled = false
  },
  keymap = {
    ["<Tab>"] = {"select_and_accept", "fallback"}
  }
})

require('telescope').load_extension('fzf')

vim.g.mapleader=" "
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pages' })
vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Telescope quickfix' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope lsp symbols' })
-- vim.keymap.set('n', '<leader>fs', builtin.lsp_workspace_symbols, { desc = 'Telescope lsp symbols' })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Telescope references' })
vim.keymap.set('n', '<leader>fc', builtin.lsp_incoming_calls, { desc = 'Telescope incoming calls' })
vim.keymap.set('n', '<leader>fC', builtin.lsp_outgoing_calls, { desc = 'Telescope outgoing calls' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Telescope outgoing calls' })
vim.keymap.set('n', '<leader>fGb', builtin.git_branches, { desc = 'Telescope outgoing calls' })
vim.keymap.set('n', '<leader>fGc', builtin.git_bcommits, { desc = 'Telescope git commits of this buffer' })
vim.keymap.set('n', '<leader>fGC', builtin.git_commits, { desc = 'Telescope all git commits' })

-- Diagnostics
vim.diagnostic.config({virtual_text = true })

-- LSP config
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')
vim.lsp.enable('rust_analyzer')
-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', {}),
--   callback = function(args)
--     local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--     if client:supports_method('textDocument/completion') then
--       local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--       client.server_capabilities.completionProvider.triggerCharacters = chars
--       vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--     end
--   end,
-- })
-- 
-- -- https://www.youtube.com/watch?v=tnlgQFQi2s4
-- vim.cmd("set completeopt+=noselect")

-- Keymaps
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
vim.keymap.set('n', ']D', function() vim.diagnostic.goto_prev() end, opts)
vim.keymap.set('n', ']k', function() vim.diagnostic.open_float() end, opts)

vim.cmd("nnoremap ]m yiwq:iMan<Space><Esc>p<CR>")
vim.cmd("vnoremap ]m yq:iMan<Space><Esc>p<CR>")

