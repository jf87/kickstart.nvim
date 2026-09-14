return {
  {
    -- C-h/j/k/l moves between nvim splits and tmux panes (see ~/dotfiles/tmux.conf)
    'christoomey/vim-tmux-navigator',
    cmd = { 'TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateUp', 'TmuxNavigateRight' },
    keys = {
      { '<C-h>', '<cmd>TmuxNavigateLeft<cr>', desc = 'Move focus left (split or tmux pane)' },
      { '<C-j>', '<cmd>TmuxNavigateDown<cr>', desc = 'Move focus down (split or tmux pane)' },
      { '<C-k>', '<cmd>TmuxNavigateUp<cr>', desc = 'Move focus up (split or tmux pane)' },
      { '<C-l>', '<cmd>TmuxNavigateRight<cr>', desc = 'Move focus right (split or tmux pane)' },
    },
  },
}
