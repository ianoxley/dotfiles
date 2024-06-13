-- lsp_config.lua
require('mason').setup()
require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls', 'ruby_lsp' }
}

-- require('lspconfig').lua_ls.setup {}
require('lspconfig').ruby_lsp.setup {}

vim.opt.signcolumn = "yes"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.lsp.start {
      name = "rubocop",
      -- cmd = { "bundle", "exec", "rubocop", "--lsp" },
      cmd = { "rubocop", "--lsp" },
    }
  end,
})

-- autocorrect on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rb",
  callback = function()
    vim.lsp.buf.format()
  end,
})
