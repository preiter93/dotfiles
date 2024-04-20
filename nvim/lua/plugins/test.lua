return {
	-- Testing
	"vim-test/vim-test",
	config = function()
		vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est [F]ile' })
		vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = '[T]est [N]earest' })
		vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est [L]ast' })
		vim.keymap.set('n', '<leader>tv', ':TestVisit<CR>', { desc = '[T]est [V]isit' })
	end
}
