vim.keymap.set("i", "jj", "<Esc>", {noremap=true})
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>", {desc="Find files with fzf"})
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", {desc="Clear search highlights"})


-- Highlight when yanking.
vim.api.nvim_create_autocmd(
    'TextYankPost',
    {
        desc = 'Highlight yanked content',
        group = vim.api.nvim_create_augroup(
            'highlight-yank',
            { clear = true }
        ),
        callback = function()
            vim.highlight.on_yank()
        end,
    }
)
