return {
  {
    'lervag/vimtex',
    ft = { 'tex', 'latex', 'bib' },
    init = function()
      -- All vimtex settings must be set before plugin loads (in init, not config)

      -- Compiler settings
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1,
        options = {
          '-pdf',
          '-pdflatex="pdflatex --shell-escape %O %S"',
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
        },
      }

      -- Disable syntax conceal
      vim.g.vimtex_syntax_conceal_disable = 1

      -- Quickfix settings
      vim.g.vimtex_quickfix_open_on_warning = 1
      vim.g.vimtex_quickfix_ignore_filters = {
        'Overwriting file',
        'Marginpar on page',
      }

      -- Minted syntax highlighting
      vim.g.vimtex_syntax_minted = {
        { lang = 'c' },
        { lang = 'cpp', environments = { 'cppcode', 'cppcode_test' } },
        { lang = 'csharp', syntax = 'cs' },
        { lang = 'python', ignore = { 'pythonEscape', 'pythonBEscape' } },
      }

      -- OS-dependent viewer
      if vim.fn.has('macunix') == 1 then
        vim.g.vimtex_view_method = 'skim'
      else
        vim.g.vimtex_view_method = 'zathura'
      end

      -- Neovim remote (for callback support)
      vim.g.vimtex_compiler_progname = 'nvr'
    end,
  },
}
