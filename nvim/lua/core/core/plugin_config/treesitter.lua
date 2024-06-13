-- treesitter.lua
require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'lua', 'ruby', 'typescript', 'vim' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
