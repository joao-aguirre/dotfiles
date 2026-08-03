-- Python LSP settings.

vim.lsp.enable("ty")

vim.lsp.config(
    "basedpyright",
    {settings = {basedpyright = {disableOrganizeImports = true}}}
)

-- vim.lsp.enable("basedpyright")
vim.lsp.enable("ruff")

vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = "*.py",
        callback = function()
            vim.lsp.buf.format(
                {
                    filter = function(client)
                        return client.name == "ruff"
                    end,
                }
            )
        end,
    }
)
