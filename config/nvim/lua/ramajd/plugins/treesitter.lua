return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install({
      'javascript', 'typescript', 'tsx',
      'json', 'jsdoc',
      'html', 'css',
      'regex',
      'lua',
      'python',
      'c', 'cpp',
      'rust',
      'query',
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'javascript', 'javascriptreact', 'typescript', 'typescriptreact',
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
