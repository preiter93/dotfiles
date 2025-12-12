return {
    {
        'tpope/vim-fugitive',
        config = function()
            vim.keymap.set("n", "<leader>gg", ":Git<CR>", { desc = '[g]it status' })
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = '[g]it [p]review hunk' })
            vim.keymap.set("n", "<leader>gl", ":Gitsigns toggle_current_line_blame<CR>", { desc = '[g]it [l]ine blame' })
            vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = '[g]it [n]ext hunk' })
            vim.keymap.set("n", "<leader>gN", ":Gitsigns previous_hunk<CR>", { desc = '[g]it previous hunk' })
            vim.keymap.set("n", "<leader>gsh", ":Gitsigns stage_hunk<CR>", { desc = '[g]it [s]tage [h]unk' })
            vim.keymap.set("n", "<leader>gsb", ":Gitsigns stage_buffer<CR>", { desc = '[g]it [s]tage [b]uffer' })
            vim.keymap.set("n", "<leader>grh", ":Gitsigns reset_hunk<CR>", { desc = '[g]it [r]eset [h]unk' })
            vim.keymap.set("n", "<leader>grb", ":Gitsigns reset_buffer<CR>", { desc = '[g]it [r]reset [b]uffer' })
            vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { desc = '[g]it [d]iff view' })
            vim.keymap.set("n", "gdh", ":diffget //2<CR>", { desc = '[g]it [d]iff apply left' })
            vim.keymap.set("n", "gdl", ":diffget //3<CR>", { desc = '[g]it [d]iff apply right' })
        end
    }
}
