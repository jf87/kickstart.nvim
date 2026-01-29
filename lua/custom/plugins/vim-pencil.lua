return {
  {
    'preservim/vim-pencil',
    -- 1. ADD 'tex' to this list so it loads for LaTeX files
    ft = { 'text', 'markdown', 'rmd', 'vimwiki', 'yaml', 'tex' },
    lazy = true,
    init = function()
      -- Sets the default mode to 'soft' (visual wrap)
      vim.g['pencil#wrapModeDefault'] = 'soft'
    end,
    config = function()
      -- 2. DEFINE THE ACTIVATION LOGIC
      -- This runs automatically after the plugin is loaded

      -- Create an autocmd so Pencil starts for every new file of these types
      local pencil_group = vim.api.nvim_create_augroup('PencilMode', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'text', 'markdown', 'rmd', 'vimwiki', 'yaml', 'tex' },
        group = pencil_group,
        callback = function()
          vim.cmd 'PencilSoft'
          -- Optional: Turn on spellcheck automatically for these files
          -- vim.opt_local.spell = true
        end,
      })

      -- 3. INITIALIZE FOR CURRENT BUFFER
      -- Because lazy loading happens *after* the file is opened, the first
      -- autocmd might be missed. We manually trigger it once here.
      vim.cmd 'PencilSoft'
    end,
  },
}
