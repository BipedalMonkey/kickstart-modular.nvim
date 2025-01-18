-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

local opts = {
  filesystem = {
    bind_to_cwd = true,
    filtered_items = {
      visible = true,
    },

    hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
}

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' }, silent = true },
  },

  init = function()
    -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
    -- because `cwd` is not set up properly.
    -- this stops netrw flashing on startup
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
      desc = 'Start Neo-tree with directory',
      once = true,
      callback = function()
        if package.loaded['neo-tree'] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == 'directory' then
            require('neo-tree').setup(opts)
          end
        end
      end,
    })
  end,

  opts = opts,
}
