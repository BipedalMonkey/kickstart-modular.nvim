return {
  'frankroeder/parrot.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require('parrot').setup {
      -- Providers must be explicitly added to make them available.
      providers = {
        -- provide an empty list to make provider available (no API key required)
        ollama = {},
      },
    }
  end,

  keys = {
    { '<C-g>c', '<cmd>PrtChatNew<cr>', mode = { 'n', 'i' }, desc = 'New Chat' },
    { '<C-g>c', ":<C-u>'<,'>PrtChatNew<cr>", mode = { 'v' }, desc = 'Visual Chat New' },
    { '<C-g>t', '<cmd>PrtChatToggle<cr>', mode = { 'n', 'i' }, desc = 'Toggle Popup Chat' },
    { '<C-g>f', '<cmd>PrtChatFinder<cr>', mode = { 'n', 'i' }, desc = 'Chat Finder' },
    { '<C-g>r', '<cmd>PrtRewrite<cr>', mode = { 'n', 'i' }, desc = 'Inline Rewrite' },
    { '<C-g>r', ":<C-u>'<,'>PrtRewrite<cr>", mode = { 'v' }, desc = 'Visual Rewrite' },
    {
      '<C-g>j',
      '<cmd>PrtRetry<cr>',
      mode = { 'n' },
      desc = 'Retry rewrite/append/prepend command',
    },
    { '<C-g>a', '<cmd>PrtAppend<cr>', mode = { 'n', 'i' }, desc = 'Append' },
    { '<C-g>a', ":<C-u>'<,'>PrtAppend<cr>", mode = { 'v' }, desc = 'Visual Append' },
    { '<C-g>o', '<cmd>PrtPrepend<cr>', mode = { 'n', 'i' }, desc = 'Prepend' },
    { '<C-g>o', ":<C-u>'<,'>PrtPrepend<cr>", mode = { 'v' }, desc = 'Visual Prepend' },
    { '<C-g>e', ":<C-u>'<,'>PrtEnew<cr>", mode = { 'v' }, desc = 'Visual Enew' },
    { '<C-g>s', '<cmd>PrtStop<cr>', mode = { 'n', 'i', 'v', 'x' }, desc = 'Stop' },
    {
      '<C-g>i',
      ":<C-u>'<,'>PrtComplete<cr>",
      mode = { 'n', 'i', 'v', 'x' },
      desc = 'Complete visual selection',
    },
    { '<C-g>x', '<cmd>PrtContext<cr>', mode = { 'n' }, desc = 'Open context file' },
    { '<C-g>n', '<cmd>PrtModel<cr>', mode = { 'n' }, desc = 'Select model' },
    { '<C-g>p', '<cmd>PrtProvider<cr>', mode = { 'n' }, desc = 'Select provider' },
    { '<C-g>q', '<cmd>PrtAsk<cr>', mode = { 'n' }, desc = 'Ask a question' },
  },
}
