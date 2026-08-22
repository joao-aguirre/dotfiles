return {
    "liba2k/languagetool.nvim",
    keys = {
        {"<leader>lc", "<cmd>LTCheck<cr>", desc = "Check line"},
        {"<leader>lc", ":LTCheck<cr>", mode = "v", desc = "Check selection"},
        {"<leader>lb", "<cmd>LTCheckBuffer<cr>", desc = "Check buffer"},
        {"<leader>lf", "<cmd>LTFix<cr>", desc = "Show fixes"},
        {"<leader>lx", "<cmd>LTClear<cr>", desc = "Clear diagnostics"},
    },
    config = function()
        require("languagetool").setup({
            -- LanguageTool server URL
        server_url = "http://localhost:8081",
            -- Language code (e.g., "en-US", "de-DE", "fr")
        language = "en-US",
            -- Severity mapping for different issue types
            severity = {
                typographical = vim.diagnostic.severity.HINT,
                grammar = vim.diagnostic.severity.WARN,
                misspelling = vim.diagnostic.severity.ERROR,
                style = vim.diagnostic.severity.INFO,
                default = vim.diagnostic.severity.WARN,
            },
        })
    end,
}
