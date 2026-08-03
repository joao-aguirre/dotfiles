return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect", "popup" }
        vim.o.autocomplete = true
        vim.opt.complete:append("o")
        vim.diagnostic.config({ update_in_insert = false })

        require("config.lsp.python")
        require("config.lsp.latex")
    end,
}
