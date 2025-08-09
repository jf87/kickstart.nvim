return {
  {
    'vimwiki/vimwiki',
    lazy = false, -- Ensure the plugin loads on startup
    init = function()
      vim.g.vimwiki_list = {
        {
          path = vim.fn.expand '~' .. '/Library/CloudStorage/OneDrive-ZHAW',
          syntax = 'markdown',
          ext = 'md',
          path_html = vim.fn.expand '~' .. '/Library/CloudStorage/OneDrive-ZHAW/html',
          custom_wiki2html = vim.fn.expand '~' .. '/dotfiles/vim/convert.py',
          nested_syntaxes = { ['python'] = 'python', ['c++'] = 'cpp' },
        },
      }
    end,
    config = function()
      -- Autocommand for VimWiki Diary Template
      vim.api.nvim_create_autocmd('BufNewFile', {
        pattern = { '*/diary/*.md' }, -- More flexible pattern
        command = 'silent 0r !'
          .. vim.fn.expand '~'
          .. "/dotfiles/vim/generate-vimwiki-diary-template.py '%' "
          .. vim.fn.expand '~'
          .. '/Library/CloudStorage/OneDrive-ZHAW',
      })
    end,
  },
}
