return {
  {
    'preservim/vim-pencil',
    ft = { 'text', 'markdown', 'rmd', 'vimwiki', 'yaml' },
    lazy = true,
    init = function()
      vim.g['pencil#wrapModeDefault'] = 'soft'
    end,
  },
}
