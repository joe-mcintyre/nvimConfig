local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })

vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({
    layout_strategy = 'vertical',
    search = vim.fn.input("Grep >> "),
    layout_config = {
      width = 0.7,
      height = 0.9,
    }
  });
end)

vim.keymap.set('v', '<leader>ps', function()
    builtin.grep_string({
        layout_strategy = 'vertical',
        layout_config = {
            width = 0.7,
            height = 0.9,
        }
    })
end)
