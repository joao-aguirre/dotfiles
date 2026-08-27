vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "texlab" then
            local opts = {
                buffer = args.buf,
                silent = true,
            }

            vim.keymap.set(
                "n",
                "<leader>lb",
                "<cmd>LspTexlabBuild<cr>",
                vim.tbl_extend("force", opts, { desc = "LaTeX build" })
            )

            vim.keymap.set(
                "n",
                "<leader>lp",
                "<cmd>LspTexlabForward<cr>",
                vim.tbl_extend("force", opts, { desc = "LaTeX open PDF" })
            )
        end
    end,
})

vim.lsp.enable("texlab")

