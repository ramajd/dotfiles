local maps = vim.keymap

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { "nvim-lua/plenary.nvim" },
  module = "telescope",

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')
    maps.set('n', '<leader>fg', builtin.git_files, {})
    maps.set('n', '<leader>fr', builtin.live_grep, {})
    maps.set('n', '<leader>ff', builtin.find_files, {})
    maps.set('n', '<leader>fb', builtin.buffers, {})
    maps.set('n', '<leader>fh', ":Telescope find_files hidden=true <CR>")

    maps.set('n', '<leader>pws', function()
      local word = vim.fn.expand('<cword>')
      builtin.grep_string({ search = word })
    end)

    maps.set('n', '<leader>pWs', function()
      local word = vim.fn.expand('<cWORD>')
      builtin.grep_string({ search = word })
    end)
  end
}
